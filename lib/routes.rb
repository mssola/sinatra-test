

require 'flash'

module Leaky
  module Routes
    def self.included(lk)
      leaked_get(lk, :index)
      leaked_get(lk, :blog)
      leaked_get(lk, :snippets)
      leaked_get(lk, :contact)
      leaked_get(lk, :login)

      leaked_get(lk, :not_found)
    end

    def self.leaked_get(obj, action)
      aux = (action == :index) ? '' : action.to_s
      obj.get "/#{aux}" do
        @flash = Flash.new
        erb action
      end
    end
  end
end 
