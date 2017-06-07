class Hanoi
  attr_accessor :towers

  def initialize
    @towers = [[4, 3, 2, 1], [], []]
  end

  def play
    until won?
      begin
        p @towers
        puts "Enter starting and ending column"
        input = gets.chomp
        first, last = input.split(",").map(&:to_i)

        move(first, last)
      rescue ArgumentError
        puts "That input is not valid"
        retry
      end
    end
  end

  def move(first, last)
    raise ArgumentError if first > 2 || last > 2
    if valid_move?(first, last)
      @towers[last].push(@towers[first].pop)
    else
      puts "You can't move there"
    end
  end

  def won?
    @towers[0].empty? && @towers[1].length == 4 || @towers[2].length == 4
  end

  private
  def valid_move?(first, last)
    @towers[last].empty? || @towers[first].last < @towers[last].last
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Hanoi.new
  game.play
end
