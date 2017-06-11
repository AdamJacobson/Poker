require "hand"
require "rspec"

describe Hand do
  subject (:hand) { Hand.new }
  let (:card1) { double("card 1") }
  let (:card2) { double("card 2") }
  let (:card3) { double("card 3") }
  let (:card4) { double("card 4") }
  let (:card5) { double("card 5") }
  let (:card6) { double("card 6") }

  context "#new" do
    it "should initialize with no cards" do
      expect(hand.cards).to eq([])
    end
  end

  context "#discard" do
    it "should remove chosen cards from hand" do
      hand.add_cards([card1, card2, card3, card4, card5])
      hand.discard([3, 4])
      expect(hand.cards.length).to eq(3)
      expect(hand.cards).not_to include(card4)
      expect(hand.cards).not_to include(card5)
    end
  end

  context "#add_cards" do
    it "adds the cards to the hand" do
      hand.add_cards([card1])
      expect(hand.cards).to include(card1)
    end

    it "raises an error when adding to more than 5 cards" do
      hand.add_cards([card1, card2, card3, card4, card5])
      expect(hand.cards.length).to eq(5)
      expect { hand.add_cards([card6]) }.to raise_error "Too many cards"
    end
  end
end
