require 'rspec'
require 'deck'

describe Deck do
  let ("deck") { Deck.new }

  context "#new" do

    it "creates a new deck of 52 shuffled cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards).to not_eq(deck.cards.sort_by { |c1, c2| c1.rank <=> c2.rank })
    end
  end

  context "#shuffle" do
    it "shuffles the deck"
  end

  context "#draw" do
    it "takes the number of cards from the deck"
  end

end
