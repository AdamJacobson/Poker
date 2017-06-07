require 'rspec'
require 'tdd'

describe Array do
  describe "#remove_dups" do
    context "when called on an array with duplicates" do
      let ("original") { [1, 2, 1, 3, 3] }

      it "removes the duplicates" do
        expect(original.remove_dups).to eq([1, 2, 3])
      end

      it "Doesn't modify the original array." do
        original.remove_dups
        expect(original).to eq([1, 2, 1, 3, 3])
      end
    end
  end

  describe "#two_sum" do
    context "When called on a array" do
      let ("numbers") { [-1, 0, 2, -2, 1] }
      let ("result") { numbers.two_sum }

      it "return an array of arrays" do
        expect(result).to be_a(Array)
        expect(result.all? { |elem| elem.is_a? Array} ).to be(true)
      end

      it "returns an array of pairs which sum to zero." do
        answer = result.all? { |pair| numbers[pair.first] + numbers[pair.last] == 0 }
        expect(answer).to be(true)
      end

      it "returns an array sorted dictionary wise." do
        expect(result).to eq(result.sort)
      end
    end
  end

  describe "#transpose" do
    let(:matrix) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    let(:result) { matrix.my_transpose }

    it "return an array of arrays" do
      expect(result).to be_a(Array)
      expect(result.all? { |elem| elem.is_a? Array} ).to be(true)
    end

    it "returns transposed elements" do
      expect(result).to eq([[1,4,7],[2,5,8],[3,6,9]])
    end

    it "all arrays are the same length" do
      length = result[0].length
      answer = result.all? { |elem| elem.length == length }
      expect(answer).to be(true)
    end
  end

  describe "#stock_picker" do
    let(:stocks) { [2,1,3,4,3,10,3,0] }
    let(:result) { stocks.stock_picker }

    it "returns an array of indicies" do
      expect(result).to be_a(Array)
    end

    it "outputs the most profitable pair of days" do
      expect(result).to eq([1, 5])
    end
  end
end
