require 'rspec'
require 'game'

describe Game do
  let(:player1) { double("player1") }
  let(:player2) { double("player2") }
  let(:player3) { double("player3") }
  let(:player4) { double("player4") }
  subject(:game) { Game.new([player1, player2, player3, player4]) }

  context "#new" do
    it "initializes with an array of players" do
      expect(game.players).to eq([player1, player2, player3, player4])
    end
  end

  context "#play_round" do
    it "deals a new hand to all players"
  end

end
