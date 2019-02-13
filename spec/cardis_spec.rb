RSpec.describe Cards do
    it "does something" do
        c1 = Cards::Card.new(:club, :two)
        c2 = Cards::Card.new(:heart, :three)
        c3 = Cards::Card.new(:heart, :ace)
        cards = Cards::Cardis.new(c1,c2,c3)
        expect(cards.to_a.size).to eq(3)
    end
end