require 'rspec/core/rake_task'

desc "Loads the Rails app and its tasks"
task :app do
  require File.expand_path('../config/application', __FILE__)
  GrpExp::Application.load_tasks
end

RSpec::Core::RakeTask.new do |t|
  t.pattern    = "./spec/**/*_spec.rb"
  t.rspec_opts = '-c'
  t.verbose    = false
end

desc "Run the Acceptance Tests"
task :acceptance => :app do
  Rake::Task['cucumber'].invoke
end

desc "Run the Rails Tests"
task :rails => :app do
  Rake::Task['test'].invoke
end

desc "Run the Unit Tests"
task :unit => :spec

task :default => :unit
