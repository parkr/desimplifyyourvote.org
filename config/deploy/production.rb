set :deploy_to, "/var/www/desimplifyyourvote/production"
set :deploy_via, :remote_cache
set :deploy_env, 'production'
set :db_env, 'production'
set :use_sudo, false

ssh_options[:username] = "root"
ssh_options[:keys] = [File.join("","Users","parkermoore",".ssh","id_rsa")]

role :app, '198.61.177.108'