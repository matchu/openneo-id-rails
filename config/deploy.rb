set :application, "newid.openneo.net"
set :local_repository,  "ssh://rails@newimpress/~/repos/openneo-id.git"
set :repository, "/home/rails/repos/openneo-id.git"
set :deploy_to, "/home/rails/openneo_id"
set :user, "rails"
set :branch, "deploy"
default_run_options[:pty] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, application
role :app, application
role :db,  application, :primary => true

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
set :rvm_ruby_string, 'ruby-1.9.2@openneo_id'        # Or whatever env you want it to run in.
require "bundler/capistrano"
#require 'rvm/capistrano'

namespace :deploy do
  task :start do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop do

  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
