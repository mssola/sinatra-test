
require 'rubygems'
require 'bundler'

Bundler.setup
Bundler.require(:runtime)

require './server'

use Rack::Static, :urls => ['favicon.ico', '/stylesheets', '/images',
                            '/javascripts, /robots.txt'], :root => 'public'
run Leaky::Server
