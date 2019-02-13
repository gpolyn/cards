RSpec.describe Cards::Rank do
    it "gives expected order" do
        shuffled = Cards::RANKS.shuffle.collect {|sym| Cards::Rank.new(sym)}
        sorted = shuffled.sort
        Cards::RANKS.each_with_index do |item, idx|
            expect(sorted[idx].value).to eq(item)
        end
    end

    it "gives correct nextTo values in at least one case" do
        sorted = Cards::RANKS.collect {|sym| Cards::Rank.new(sym)}
        expect(sorted.first.nextTo?(sorted[1])).to be(true)
        expect(sorted[1].nextTo?(sorted.first)).to be(true)
    end
end