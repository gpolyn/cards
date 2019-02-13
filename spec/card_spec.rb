RSpec.describe Cards::Card do
    it "has given rank" do
        card = Cards::Card.new(:club, :two)
        expect(card.rank).to eq(:two)
    end
    it "has given suit" do
        card = Cards::Card.new(:club, :two)
        expect(card.suit).to eq(:club)
    end
end