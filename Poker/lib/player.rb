require_relative 'hand'
require 'byebug'

class Player
  attr_reader :hand, :name, :bankroll

  def initialize(name, game)
    @name = name
    @game = game
    @hand = Hand.new
    @bankroll = 200
  end

  def bet(num)
    # debugger
    @bankroll -= num
    @game.bet(self, num)
  end
end
