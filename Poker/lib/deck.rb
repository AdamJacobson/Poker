require_relative "card"

class Deck

  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  private

  ALL_SUITS = [:S, :D ,:H ,:C]
  ALL_RANKS = (1..13).to_a

  def create_deck
    cards = []
    ALL_SUITS.each do |suit|
      ALL_RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards
  end

end
