require 'rspec'
require 'rack/test'
require_relative '../app/app.rb'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
