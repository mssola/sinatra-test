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


require 'digest/md5'


module Leaky #:nodoc:
  ##
  # Define all the helpers methods that can be called from views.
  module ViewHelpers
    ##
    # Get the avatar url for the given @p email.
    def get_gravatar_of(email)
      hash = Digest::MD5.hexdigest(email)
      "https://secure.gravatar.com/avatar/#{hash}"
    end

    ##
    # Get the current authenticated user.
    #
    # @return *User* the currently authenticated user. If no user is
    # authenticated, return nil.
    def current_user
      if auth_token = request.cookies['auth_token']
        User.first(:auth_token => auth_token)
      else
        nil
      end
    end

    # Define the methods above as module functions.
    module_function :get_gravatar_of, :current_user
  end
end
