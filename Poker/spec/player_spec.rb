require 'rspec'
require 'player'
require 'hand'

describe Player do
  let(:game) { double("game") }
  let(:player) { Player.new("Player 1", game) }
  context "#new" do
    it "initializes with a hand" do
      expect(player.hand).to be_a(Hand)
    end

    it "initializes with a name" do
      expect(player.name).to eq("Player 1")
    end

    it "should initialize with a pot of 200" do
      expect(player.pot).to eq(200)
    end
  end

  # context "#pot" do
  #   it ""
  # end

  context "#bet" do
    it "it removes amount from pot" do
      player.bet(10)
      expect(player.pot).to eq(190)
    end

    it "adds amount to the game pot" do
      game.bet(10)
      expect(game).to receive(:method_name).with(10)
    end
  end
end
