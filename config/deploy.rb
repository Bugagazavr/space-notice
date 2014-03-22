set :application, "space-notice"
set :repo_url,  "git@github.com:releu/space-notice.git"

set :deploy_to, "/home/git/apps/#{application}"
set :scm, :git

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

set :rbenv_type, :system
set :rbenv_ruby, "2.1.1"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem puma ruby rails}

set :assets_roles, [:web, :app]

namespace :deploy do
  desc "Restart application"
  task :restart do
    
  end
  after :finishing, "deploy:cleanup"
end
