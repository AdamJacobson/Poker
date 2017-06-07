require "rspec"
require "hanoi"

describe Hanoi do
  let(:hanoi) { Hanoi.new }
  context "#move" do
    context "with invalid input" do
      it "raises an error" do
        expect { hanoi.move(3, 1) }.to raise_error(ArgumentError)
      end

      it "Doesn't modify the towers" do
        towers = hanoi.towers
        expect { hanoi.move(3, 1) }.to raise_error(ArgumentError)
        expect(hanoi.towers).to eq(towers)
      end
    end

    context "With valid input" do
      context "with a vaild move" do
        it "moves top stack to new position" do
          hanoi.move(0, 1)
          towers = hanoi.towers
          expect(towers[0].last).to eq(2)
          expect(towers[1].last).to eq(1)
        end
      end

      context "with an invalid move" do
        it "prevents moving larger disc onto smaller disc" do
          hanoi.move(0, 1) # valid
          towers = hanoi.towers
          hanoi.move(0, 1) # not valid

          expect(hanoi.towers).to be(towers)
        end
      end
    end
  end

  context "#won?" do
    it "should be false when game starts" do
      expect(hanoi.won?).to be(false)
    end

    it "should be true when all discs are on one tower other than starting tower." do
      hanoi.towers = [[], [4,3,2,1], []]
      expect(hanoi.won?).to be(true)
    end

    it "false when all discs are dispursed among towers other than starting tower" do
      hanoi.towers = [[], [4,3], [2,1]]
      expect(hanoi.won?).to be(false)
    end
  end
end
