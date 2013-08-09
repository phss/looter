require_relative '../../app/app.rb'
require 'capybara/cucumber'
require 'rspec/expectations'

Capybara.app = LooterApp
