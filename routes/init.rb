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


require 'flash'


module Leaky #:nodoc:
  ##
  # Define all the logic behind the routing of this application. This module
  # is expected to be included by the Server of this application.
  module Routes
    ##
    # When included, include also all the submodules that do the
    # real work and define some other routes for error handling.
    #
    # @param *Sinatra::Base* obj The server of this application that wants
    # to include this module.
    def self.included(obj)
      obj.send :include, Leaky::Routes::Main
      obj.send :include, Leaky::Routes::Session

      obj.not_found do
        erb :not_found
      end
    end

    ##
    # Let this Base module to define some helper methods that will simplify
    # the logic of the submodules defined on other files.
    module Base
      ##
      # Helper method for HTTP GET requests.
      #
      # @param *Sinatra::Base* obj The server of this application.
      #
      # @param *Symbol* action The action performed. The route to create
      # will therefore have a "/#{action}" pattern (unless it's :index, case
      # of which the root path will be taken). The view to render is expected
      # to have the same name.
      def leaked_get(obj, action)
        aux = (action == :index) ? '' : action.to_s
        obj.get "/#{aux}" do
          @flash = Leaky::Flash.new
          erb action
        end
      end
    end
  end
end

# Last but not least, require all the submodules of Leaky::Routes.
require_relative 'main'
require_relative 'session'
