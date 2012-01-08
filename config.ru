
require 'rubygems'
require 'bundler'

Bundler.setup
Bundler.require(:runtime)

require './server'
run Leaky::Server
