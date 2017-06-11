require_relative "card"

class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_cards(new_cards)
    if @cards.length + new_cards.length < 6
      @cards += new_cards
    else
      raise "Too many cards"
    end
  end

  def num_cards
    @cards.length
  end

  def discard(discards)
    @cards.each_with_index do |_, idx|
      @cards[idx] = nil if discards.include?(idx)
    end
    @cards -= [nil]
  end

  def to_s
    # @cards.map(&:to_s).join(" ")
    # [[1,2,3],[1,2,3],[1,2,3],[1,2,3],[1,2,3]]

    lines = @cards.map(&:to_a)

    line_idx = 0
    until line_idx == lines[0].length
      card_idx = 0
      until card_idx == lines.length
        print lines[card_idx][line_idx]
        card_idx += 1
      end
      print "\n"
      line_idx += 1
    end
  end

end
