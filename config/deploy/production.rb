# -*- encoding : utf-8 -*-
set :stage, :staging
set :branch, 'master'
set :rvm_type, :user
set :rvm_ruby_version, '2.1.0'
set :deploy_user, 'deploy'

server '101.200.180.153', user: 'deploy', roles: %w{web app db}

set :deploy_to, "/srv/www/YuFuJob"
set :rails_env, :production