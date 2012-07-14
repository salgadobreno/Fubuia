require "bundler/capistrano"

set :application, "set your application name here"
set :repository,  "set your repository location here"

server "ec2-107-22-144-89.compute-1.amazonaws.com", :web, :app, :db, :primary => true

set :user, "ubuntu"
set :application, "fubuia"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :copy
set :use_sudo, true

set :scm, :git
set :branch, "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:keys] = ["#{ENV['HOME']}/.ec2/buzaga.pem"] unless rails_env == 'development'

after "deploy", "cleanup"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
