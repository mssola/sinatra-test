#
# Author:: Copyright (C) 2011  Miquel Sabaté (mikisabate@gmail.com)
# License::
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#


require 'sinatra'
require 'sinatra/assetpack'

$:.unshift(File.dirname(__FILE__))
require_relative 'routes/init'
require_relative 'models/user'


##
# The Server of this application. It's a direct subclass of the Sinatra::Base
# class and this is the one called by the config.ru file. It configures
# all the basic stuff of this application so we can be happy.
class Leaky::Server < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    # My default directory is not app but public.
    serve '/js', from: 'public/javascripts'
    serve '/css', from: 'public/stylesheets'

    # Tell Sinatra::AssetPack where to find all JS and CSS files.
    js :app, ['/js/*.js']
    css :app, ['/css/*.css']

    # Let YUI do all the compression in production.
    js_compression :yui, :munge => true
    css_compression :yui
  end

  # Do all the magic behind routes.
  include Leaky::Routes
end 
