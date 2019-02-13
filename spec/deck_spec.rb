RSpec.describe Cards::Deck do

    describe "no jokers" do

        @@size_of_deck_without_jokers = 52

        before do
            @deck = Cards::Deck.new()
        end

        it "contains 52 cards" do
            expect(@deck.size).to eq(@@size_of_deck_without_jokers)
        end

        it "allows selection by suit" do
            some_cards = @deck.deal(@@size_of_deck_without_jokers)
            result = some_cards.select { | card | card.suit == :clubs}
            expect(result.size).to eq(13)
        end

        it "allows selection by rank" do
            some_cards = @deck.deal(@@size_of_deck_without_jokers)
            result = some_cards.select { | card | card.rank == :two}
            expect(result.size).to eq(4)
        end

        it "deals the number of cards requested" do
            no_of_cards = 17
            expect(@deck.deal(no_of_cards).to_a.size).to eq(no_of_cards)
        end

        it "deals no more cards after the full deck is dealt" do
            @deck.deal(@@size_of_deck_without_jokers)
            expect(@deck.deal(1).to_a.size).to eq(0)
        end

        context "when not shuffled" do
            it "deals cards in suit order" do
                dealt_cards = @deck.deal(@@size_of_deck_without_jokers).to_a
                idx = 0
                Cards::SUITS.each do |suit|
                    Cards::RANKS.each do |rank|
                        expect(dealt_cards[idx]).to eq(Cards::Card.new(suit, rank))
                        idx += 1
                    end
                end
            end
        end

        context "when shuffled" do

            # chance of this failing is practically nil
            it "deals cards in apparent random order" do
                @deck.shuffle
                dealt_cards = @deck.deal(Cards::RANKS.size).to_a
                idx = 0
                found_an_unexpected_card = false
                Cards::SUITS.each do |suit|
                    Cards::RANKS.each do |rank|
                        found_an_unexpected_card = dealt_cards[idx] != Cards::Card.new(suit, rank)
                        break if found_an_unexpected_card
                        idx += 1
                    end
                    break if found_an_unexpected_card
                end
                expect(found_an_unexpected_card).to eq(true)
            end
        end

    end
    
end