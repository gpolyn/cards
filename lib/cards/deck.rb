module Cards
    class Deck
        def initialize(hasJokers: false)
            @cards = []
            SUITS.each do |suit|
                RANKS.each do |rank|
                    @cards << Card.new(suit, rank).freeze
                end
            end
        end

        def shuffle
            @cards.shuffle!
        end

        def deal(number_of_cards)
            Cards::Cardis.new(@cards.slice!(0, number_of_cards))
        end

        def size
            @cards.size
        end
    end
end