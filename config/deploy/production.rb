# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.
set :deploy_to, '/var/www/sos'
set :rails_env, 'production'
set :unicorn_path, "#{deploy_to}/current/config/unicorn/production.rb"
set :ip, "118.193.197.139"
set :user, 'hex'
set :unicorn_pid, "#{deploy_to}/current/tmp/pids/unicorn.pid"
role :app, fetch(:ip)
role :web, fetch(:ip)
role :db,  fetch(:ip)

set :password, "hexiang2o!5"
# Extended Server Syntax
# ======================t
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

set :unicorn_rack_env, "production"
set :unicorn_roles, :web

server fetch(:ip), user: fetch(:user), port: 22, password: fetch(:password), roles: %w{web}