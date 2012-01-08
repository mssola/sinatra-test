
require_relative '../server.rb'

require 'rspec'
require 'rack/test'

set :environment, :test

RSpec.configure { |cfg| cfg.include Rack::Test::Methods }
def app; Leaky::Server; end
