RSpec.describe Cards do
  it "has a version number" do
    expect(Cards::VERSION).not_to be nil
  end
  it "has four suits" do
      expect(Cards::SUITS.size).to eq(4)
  end
  it "has rank 13" do
      expect(Cards::RANKS.size).to eq(13)
  end
end
