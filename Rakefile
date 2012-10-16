#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rspec/core/rake_task'
DeSimplifyYourVote::Application.load_tasks

desc 'Migrate the test database'
task :tmig do
  ENV["RAILS_ENV"] = 'test'
  `rake db:migrate`
end
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

desc 'Production automation'
namespace :prod do
  desc 'Get the app ready for production'
  task :ready => [:migrate, :precomp]
  desc 'Migrates the production database'
  task :migrate do
    ENV["RAILS_ENV"] = 'production'
    `rake db:migrate`
  end
  desc 'Precompiles assets for production'
  task :precomp do
    ENV["RAILS_ENV"] = 'production'
    `rake assets:precompile`
  end
end