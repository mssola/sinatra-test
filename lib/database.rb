
require 'data_mapper'


# Raise an StandardError if the environment variable 'password' is not set.
# After that, we can setup the DB connection.
if ENV['password'].nil?
  raise StandardError, 'Define the environment variable \'password\''
end
DataMapper.setup :default, adapter: 'postgres', host: 'localhost',
                           username: 'mssola', password: ENV['password'],
                           database: 'leaky' 


module Leaky #:nodoc:
  ##
  # This class represents a resource that can be mapped with the database.
  # A subclass from this one includes the DataMapper::Resource module and
  # obtains the property_* methods. Define models by subclassing this class.
  class Resource
    class << self
      ##
      # Make the base class to include the DataMapper::Resource
      def inherited(base)
        base.send :include, DataMapper::Resource
      end

      ##
      # Define the property_* methods.
      %w{ serial string }.each do |pr|
        klass = DataMapper::Property.const_get(pr.capitalize)
        define_method "property_#{pr}" do |*args|
          args.each { |a| self.property a, klass }
        end
      end
    end
  end
end
