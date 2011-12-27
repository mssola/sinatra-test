

require 'flash'

module Leaky::Routes
  def self.included(obj)
    include Leaky::Routes::Main
    include Leaky::Routes::Login
  end

  module Base
    def leaked_get(obj, action)
      aux = (action == :index) ? '' : action.to_s
      obj.get "/#{aux}" do
        @flash = Flash.new
        erb action
      end
    end
  end
end

require_relative 'main'
require_relative 'login'
