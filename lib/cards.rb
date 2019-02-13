require "cards/version"
require "cards/card"
require "cards/deck"

module Cards

  class Error < StandardError; end
  
  class Cardis
    include Enumerable
    def initialize(*cards)
      @cards = cards.flatten
    end
    def each &block
      @cards.each { |card| block.call(card) }
    end
  end
end
