set :stages, %w(demo production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require 'capistrano/nginx/tasks'

set :application, "desimplifyyourvote"
set :repository, "git@github.com:parkr/desimplifyyourvote.org.git"
set :scm, "git"
set :keep_releases, 5
set :normalize_asset_timestamps, false

after "deploy:setup", "nginx:reload"
after "deploy:update_code", "deploy:config"
#before "deploy:restart", "delayed_job:restart"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :config do
    command = ""
    ["database"].each do |config|
      command += "ln -s #{shared_path}/config/#{config}.yml #{latest_release}/config/#{config}.yml;"
    end
    command += "cd #{latest_release};"
    command += "bundle install --quiet;"
    command += "/usr/local/bin/ruby /usr/local/bin/rake prod:ready RAILS_ENV=production RAILS_GROUPS=assets;"
    run(command)
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :delayed_job do 
  task :restart, :roles => :job do
    command  = "cd #{current_path};"
    command += "RAILS_ENV=production script/delayed_job restart"
    run(command)
  end
end

namespace :sync do
  
  task :default, :role => :app do
    sync.dump_database
    sync.download_database
    sync.populate_database
  end
  
  def dump_database
    db = YAML.load_file("#{File.dirname(__FILE__)}/database.yml")[db_env]
    command  = "/usr/bin/pg_dump -U #{db['username']} -p#{db['password']} -h #{db['host']} -f #{deploy_to}/database.sql #{db['database']};"
    command += "cd #{deploy_to};"
    command += "tar -czf database.tgz database.sql;"
    command += "rm -rf database.sql;"
    run(command)
  end
  
  def download_database
    get "#{deploy_to}/database.tgz", "./tmp/database.tgz"
  end

  def populate_database
    db = YAML.load_file("#{File.dirname(__FILE__)}/database.yml")['development']
    system("tar -xzf ./tmp/database.tgz -C ./tmp")
    system("psql -U #{db['username']} -p#{db['password']} -h #{db['host']} -d #{db['database']} -f ./tmp/database.sql")
    system("rm -rf ./tmp/*") 
  end

end
