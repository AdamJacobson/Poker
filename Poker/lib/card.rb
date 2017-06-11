require 'colorize'

class Card
  attr_reader :rank, :suit

  SUITS = {
    :H => "Hearts",
    :D => "Diamonds",
    :S => "Spades",
    :C => "Clubs"
  }

  RANK_NAME = {1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"}
  SYMBOLS = { H: "♥", C: "♣", S: "♠", D: "♦" }
  # RANK_NAMES = %w(0 Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
  RANK_SHORT = %w(0 A 2 3 4 5 6 7 8 9 10 J Q K)

  def initialize(rank, suit)
    valid?(rank, suit)
    @rank, @suit = rank, suit
    @color = @suit == :H || @suit == :D ? :red : :black
  end

  def valid?(rank, suit)
    raise "not a valid rank" unless (1..13).include?(rank)
    raise "not a valid suit" unless SUITS.include?(suit)
  end

  def to_s
    rank_s = (2..10).include?(@rank) ? @rank : RANK_NAME[self.rank]
    "[#{rank_s} of #{SUITS[self.suit]}]"
  end

  def to_a
    lines = []
    lines << "┏━━━━━━┓".colorize(@color)
    lines << "┃ #{RANK_SHORT[@rank]}#{spacers}#{SYMBOLS[@suit]} ┃".colorize(@color)
    lines << "┃ #{SYMBOLS[@suit]}#{spacers}#{RANK_SHORT[@rank]} ┃".colorize(@color)
    lines << "┗━━━━━━┛".colorize(@color)
    lines
  end

  private
  def spacers
    if RANK_SHORT[@rank].length == 1
      "  "
    else
      " "
    end
  end

end
