require 'rspec'
require 'game'

describe Game do
  let(:player1) { double("player1") }
  let(:player2) { double("player2") }
  subject(:game) { Game.new([player1, player2]) }

  before(:each) do
    expect(player1).to receive(:join_game).with(game)
    expect(player2).to receive(:join_game).with(game)
  end

  context "#new" do
    it "initializes with an array of players" do
      expect(game.players).to eq([player1, player2])
    end
  end

  context "#game_over?" do
    it "returns true when only one player left"

    it "returns false when more than one player left" do
      expect(game.game_over?).to eq(false)
    end
  end

end
