require 'rspec'
require 'player'
require 'hand'

describe Player do
  let(:game) { double("game") }
  subject(:player1) { Player.new("Player 1", 200) }
  subject(:player2) { Player.new("Player 2", 200) }

  context "#new" do
    it "initializes with a hand" do
      expect(player1.hand).to be_a(Hand)
    end

    it "initializes with a name" do
      expect(player1.name).to eq("Player 1")
    end

    it "should initialize with a bankroll of 200" do
      expect(player1.bankroll).to eq(200)
    end
  end

  context "#bet" do
    before(:each) { expect(game).to receive(:bet).with(player1, 10) }

    it "it removes amount from pot" do
      player1.bet(10)
      expect(player1.bankroll).to eq(190)
    end

    it "adds amount to the game pot" do
      player1.bet(10)
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
