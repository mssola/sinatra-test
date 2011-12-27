

module Leaky
  # TODO
  class Flash
    include Enumerable

    def initialize
      @flashes = []
    end

    def each
      @flashes.each
    end
  end
end
