require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :players

  def initialize(players)
    @players = players
    @players.each { |player| player.join_game(self) }
  end

  def play
    play_round
  end

  def play_round
    @bets = Hash.new(0)
    @pot = 0
    @min_bet = 1
    deck = Deck.new

    # deal new cards to all players
    @players.each { |player| player.receive_cards(deck.draw(5)) }

    display_status

    # for all players
    # fold, bet, (see or raise)
    # have to check against minimum bet

    collect_bets

    # discard up to 3 cards

    # fold, bet, (see or raise)

    # if all but one player folds, he is the winner
    # otherwise reveal cards and check winner

    # pay winnings
    # any players with no money leave the game

    # take all cards from all players
  end

  def collect_bets
    puts "It is #{@players[0].name}'s turn first"

    @players.each do |player|
      puts "Pot is currently $#{@pot}"
      puts "#{player.name}, what will you do?"
      new_bet = get_player_action

      @pot += new_bet
      @bets[player] += new_bet

      if new_bet == @min_bet
        puts "#{player.name} bets #{new_bet}"
      elsif new_bet > @min_bet
        puts "#{player.name} raises to #{new_bet}"
        @min_bet = new_bet
      elsif new_bet == 0
        puts "#{player.name} folds"
      end

    end
  end

  def get_player_action
    puts "Type any amount equal or greater to #{@min_bet}. Or 0 to fold"
    input = gets.chomp.to_i

    until input == 0 || input >= @min_bet
      puts "Type any amount equal or greater to #{@min_bet}. Or 0 to fold"
      input = gets.chomp.to_i
    end

    input
  end

  def display_status
    puts "Pot is $#{@pot == 0 ? '0' : @pot}"
    display_player_status
    display_hands
  end

  def display_player_status
    "Current players are"
    @players.each do |player|
      puts "#{player.name}: $#{player.bankroll}"
    end
  end

  def display_hands
    @players.each do |player|
      puts "#{player.name}: #{player.print_hand}"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Adam", 200)
  player2 = Player.new("Anne", 200)
  game = Game.new([player1, player2])
  game.play
end
