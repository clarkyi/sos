# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'sos'
set :repo_url, 'https://coding.net/clarkyi/sos.git'

# Default branch is :master
ask :branch, ask("deploy git branch: ","master")

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/sos'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty
after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'deploy:cleanup'
# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    invoke 'unicorn:restart'
    on roles(:app), in: :sequence, wait: 5 do                
    end
  end
  task :start do
    on roles(:app) do 
      puts "server startup...."
      invoke "unicorn:start"
    end
  end

  task :stop do
    on roles(:app) do 
      puts "server start stop...."
      invoke "unicorn:stop"
    end
  end

  after :finishing, 'deploy:cleanup'
  before :finishing, 'deploy:restart'
  after 'deploy:rollback', 'deploy:restart'
end
