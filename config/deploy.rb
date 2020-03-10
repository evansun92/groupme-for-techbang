lock "~> 3.12.0"

set :application, "groupme-for-techbang"
set :repo_url, "git@github.com:evansun92/groupme-for-techbang.git"

# rbenv 設定
set :rbenv_type, :user
set :rbenv_ruby, "2.6.3"
set :rbenv_path, "/usr/local/rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails]
set :rbenv_roles, :all

set :deploy_to, "/home/app/groupme-for-techbang"

set :ssh_options, forward_agent: true

append :linked_files, "config/database.yml", "config/master.key"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'unicorn:reload'