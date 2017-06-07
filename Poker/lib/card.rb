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
    if (2..10).include? self.rank
      "#{@rank} of #{SUITS[self.suit]}"
    else
      "#{RANK_NAME[self.rank]} of #{SUITS[self.suit]}"
    end
  end

end
