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


module Leaky::Routes #:nodoc:
  ##
  # Handle all the routing behind sessions.
  module Session
    extend Leaky::Routes::Base

    ##
    # When included, define all the routing behind sessions.
    #
    # @param *Sinatra::Base* obj The server of this application.
    def self.included(obj)
      leaked_get(obj, :login)

      obj.post '/login' do
        puts 'TODO'
      end
    end
  end
end 
