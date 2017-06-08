require_relative 'hand'

class Player
  attr_reader :hand, :name, :pot

  def initialize(name, game)
    @name = name
    @game = game
    @hand = Hand.new
    @pot = 200
  end

  def bet(num)
    @pot -= num
  end
end
