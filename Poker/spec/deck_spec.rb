require 'rspec'
require 'deck'

describe Deck do
  let ("deck") { Deck.new }

  context "#new" do
    let ("new_deck") { Deck.new }

    it "creates a new deck of 52 shuffled cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.map(&:to_s)).not_to eq(new_deck.cards.map(&:to_s))
    end
  end

  context "#draw" do
    context "with enough cards remaining" do
      it "takes one card by default" do
        expect(deck.draw).to be_a(Array)
        expect(deck.cards.length).to eq(51)
      end

      it "takes a number of cards from the deck" do
        expect(deck.draw(3)).to be_a(Array)
        expect(deck.cards.length).to eq(49)
      end

    end
  end

end
