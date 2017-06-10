class Card
  attr_reader :rank, :suit

  SUITS = {
    :H => "Hearts",
    :D => "Diamonds",
    :S => "Spades",
    :C => "Clubs"
  }

  RANK_NAME = {1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"}

  def initialize(rank, suit)
    valid?(rank, suit)
    @rank, @suit = rank, suit
  end

  def valid?(rank, suit)
    raise ArgumentError unless (1..13).include?(rank)
    raise ArgumentError unless SUITS.include?(suit)
  end

  def to_s
    rank_s = (2..10).include?(@rank) ? @rank : RANK_NAME[self.rank]
    "[#{rank_s} of #{SUITS[self.suit]}]"
  end

end
