

module Leaky::Routes::Main
  include Leaky::Routes::Base

  def self.included(obj)
    leaked_get(obj, :index)
  end
end

