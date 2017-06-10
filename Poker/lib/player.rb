require_relative 'hand'
require 'byebug'

class Player
  attr_reader :hand, :name, :bankroll

  def initialize(name, bankroll)
    @name = name
    @hand = Hand.new
    @bankroll = bankroll
  end

  def join_game(game)
    @game = game
  end

  def bet(num)
    @bankroll -= num
    @game.bet(self, num)
  end

  def discard(discards)
    @hand.discard(discards)
  end

  def receive_cards(cards)
    @hand.add_cards(cards)
  end

  def print_hand
    @hand.to_s
  end
end
