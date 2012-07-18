require "bundler/capistrano"

server "ec2-107-21-181-51.compute-1.amazonaws.com", :web, :app, :db, :primary => true

set :application, "fubuia"
set :user, "ubuntu"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :rails_env, "mock"

set :scm, :git
set :repository, "file:///home/#{user}/Dropbox/server/fubuia.git"
set :local_repository, 'file:///home/buzaga/Dropbox/server/fubuia.git'
set :branch, 'master'


default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:keys] = ["#{ENV['HOME']}/.ec2/buzaga"]

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    #put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse server/master`
      puts "WARNING: HEAD is not the same as server/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
