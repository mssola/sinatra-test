

require 'sinatra'
require 'sinatra/assetpack'

$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require_relative 'routes/init'

class LeakyServer < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    serve '/js', from: 'public/javascripts'
    serve '/css', from: 'public/stylesheets'

    js :app, ['/js/*.js']
    css :app, ['/css/*.css']

    js_compression :yui, :munge => true
    css_compression :yui
  end

  include Leaky::Routes
end 
