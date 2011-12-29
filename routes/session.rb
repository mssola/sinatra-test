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


require 'models/user'
require 'bcrypt'


module Leaky::Routes #:nodoc:
  ##
  # Handle all the routing behind sessions.
  module Session
    include Leaky::Routes::Base

    ##
    # When included, define all the routing behind sessions.
    #
    # @param *Sinatra::Base* klass The server of this application.
    def self.included(klass)
      # Route to the login page
      leaked_get(klass, :login)

      # Login POST
      klass.post '/login' do
        user = User.first(:name => params[:name])
        if user
          pass = BCrypt::Password.new(user.password_digest)
          if pass == params[:password]
            response.set_cookie('auth_token', value: user.auth_token)
            redirect_to '/', :notice => 'You\'re now logged in!'
          else
            redirect_to '/login', :error => 'Wrong password'
          end
        else
          redirect_to '/login', :error => 'User does not exist'
        end
      end

      # The Log out method
      klass.get '/logout' do
        response.delete_cookie 'auth_token'
        redirect_to '/', :notice => 'Logged out'
      end
    end
  end
end 
