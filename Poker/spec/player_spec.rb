require 'rspec'
require 'player'
require 'hand'

describe Player do
  let(:game) { double("game") }
  subject(:player) { Player.new("Player 1", game, 200) }

  context "#new" do
    it "initializes with a hand" do
      expect(player.hand).to be_a(Hand)
    end

    it "initializes with a name" do
      expect(player.name).to eq("Player 1")
    end

    it "should initialize with a bankroll of 200" do
      expect(player.bankroll).to eq(200)
    end
  end

  context "#bet" do
    before(:each) { expect(game).to receive(:bet).with(player, 10) }

    it "it removes amount from pot" do
      player.bet(10)
      expect(player.bankroll).to eq(190)
    end

    it "adds amount to the game pot" do
      player.bet(10)
    end

    it "prevents bets when not enough money"
  end

  context "#receive_winnings" do
    it "adds the winnings to the bankroll"
  end

  context "discard" do
    it "removes"
  end
end
