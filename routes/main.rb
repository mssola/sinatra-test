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
  # Handle all the routing of the most "standard" navigation features.
  module Main
    include Leaky::Routes::Base

    ##
    # When included, define all the main routes.
    #
    # @param *Sinatra::Base* klass The server of this application.
    def self.included(klass)
      leaked_get(klass, :index)
      leaked_get(klass, :blog)
      leaked_get(klass, :snippets)
      leaked_get(klass, :contact)
    end
  end
end

