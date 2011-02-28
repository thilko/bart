load "deploy" if respond_to? :namespace
require "bundler/capistrano"

set :application, "bart"
set :scm, :git
set :repository, "git@github.com:blackhacker/#{application}.git"
set :branch, "trunk"

server "harrington1", :app, :web, :db, :primary => true
set :user, "ruby"
set :use_sudo, false

set :app_server, :passenger
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :copy

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"

