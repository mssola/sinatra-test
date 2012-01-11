
require 'lib/database'


##
# This is the User model. It's just a subclass of Leaky::Resource that
# defines the properties that can be found at the 'users' table.
class User < Leaky::Resource
  property_serial :id
  property_string :name, :password_hash, :email, :auth_token
end
