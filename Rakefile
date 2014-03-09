require 'rubygems'
require 'bundler'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format pretty --tags ~@wip'
end

desc 'Run all tests'
task 'test:all' => [:spec, :features]

task :default => ['test:all']
