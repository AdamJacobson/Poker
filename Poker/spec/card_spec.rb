require 'rspec'
require 'card'

describe Card do
  let(:good_card) { Card.new(1, :S) }
  let(:three_of_clubs) { Card.new(3, :C) }

  context "#to_s" do
    it "returns a string representing the card" do
      expect(good_card.to_s).to eq("[Ace of Spades]")
      expect(three_of_clubs.to_s).to eq("[3 of Clubs]")
    end
  end

  context "#new" do
    context "with valid data" do
      it "has a rank" do
        expect(good_card.rank).to eq(1)
      end

      it "has a suit" do
        expect(good_card.suit).to eq(:S)
      end
    end

    context "with invalid data" do
      let(:bad_rank) { Card.new(14, :H) }
      let(:bad_suit) { Card.new(11, :X) }
      it "raise error if invalid rank" do
        expect { bad_rank }.to raise_error("not a valid rank")
      end

      it "raise error if invalid suit" do
        expect { bad_suit }.to raise_error("not a valid suit")
      end
    end
  end
end
