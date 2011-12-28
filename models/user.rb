
require 'data_mapper'

DataMapper.setup(:default, 'sqlite3:leaky.db')

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :password_digest, String
  property :email, String
end
