
require 'data_mapper'

DataMapper.setup :default, adapter: 'postgres', host: 'localhost',
                           username: 'mssola', password: ENV['password'],
                           database: 'leaky'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :password_hash, String
  property :email, String
  property :auth_token, String
end
