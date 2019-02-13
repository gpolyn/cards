module Cards

    SUITS = [:hearts, :diamonds, :clubs, :spades]
    RANKS = [:two, :three, :four,
             :five, :six, :seven, :eight,
             :nine, :ten, :jack, :queen,
             :king, :ace ]

    class Rank
        include Comparable
        attr :order, :value

        def <=>(other)
          order <=> other.order
        end

        def nextTo?(other)
            diff = @order - Cards::RANKS.index(other.value)
            diff.abs == 1 || diff.abs == Cards::RANKS.size
        end

        def initialize(value)
          @order = Cards::RANKS.index value
          @value = value
        end
    end
    
    class Card
        attr_reader :suit, :rank

        def initialize(suit, rank)
            @suit = suit
            @rank = rank
        end

        def ==(other)
            @rank == other.rank && @suit == other.suit
        end
    end

end