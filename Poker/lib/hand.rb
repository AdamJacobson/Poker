require_relative "card"

class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_cards(new_cards)
    if @cards.length + new_cards.length < 6
      @cards += new_cards
    else
      raise TooManyCardsError
    end
  end

  def discard(discards)
    @cards.each_with_index do |_, idx|
      @cards[idx] = nil if discards.include?(idx)
    end
    @cards -= [nil]
  end

  def to_s
    @cards.map(&:to_s).join(" ")
  end

end

class TooManyCardsError < StandardError
end
