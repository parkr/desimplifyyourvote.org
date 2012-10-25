set :deploy_to, "/var/www/desimplifyyourvote/staging"
set :deploy_via, :remote_cache
set :deploy_env, 'production'
set :db_env, 'production'
set :use_sudo, false
set :server_name, "staging.desimplifyyourvote.org"
set :sudo_user, "root"

ssh_options[:username] = "root"
ssh_options[:keys] = [File.join("","Users","parkermoore",".ssh","id_rsa")]
default_run_options[:pty] = true

role :app, '198.61.177.108'