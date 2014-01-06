set :application, Configs.role.app.name
set :repo_url, "git@github.com:open-cook/open-cook.git"
set :branch, :master # ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :scm, :git
set :keep_releases, 5
set :deploy_to, Configs.role.app.deploy_to

# App Params
set :site_name, Configs.role.app.name
set :user,      Configs.role.app.ssh.user

# Dirs
set :bin_dir,     "#{ shared_path }/bin"
set :pids_dir,    "#{ shared_path }/tmp/pids"
set :sockets_dir, "#{ shared_path }/tmp/sockets"
set :configs_dir, "#{ shared_path }/config"
set :log_dir,     "#{ shared_path }/log"

set :web_server_dir, "#{ shared_path }/web_server"

# WebServer params
set :web_server_socket,  Configs.unicorn.socket_name
set :web_server_workers, Configs.unicorn.workers
set :web_server_user,    fetch(:user)

set :web_server_config,  "#{ fetch :web_server_dir }/unicorn/config.rb"
set :web_server_sock,    "#{ fetch :sockets_dir }/unicorn.sock"
set :web_server_pid,     "#{ fetch :pids_dir }/unicorn.pid"

set :web_server_log,     "#{ fetch :log_dir }/unicorn.log"
set :web_server_err,     "#{ fetch :log_dir }/unicorn.err"

set :linked_files, %w{ config/database.yml }
set :linked_dirs,  %w{ bin log tmp/cache tmp/pids tmp/sockets vendor/bundle public/system }
# set :default_env,  { path: "/opt/ruby/bin:$PATH" }

# DEFINE TASKS ORDER
before "configs:copy", "configs:dir"
before "deploy:check:linked_files", "configs:copy"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      task! "web_server:restart"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
end