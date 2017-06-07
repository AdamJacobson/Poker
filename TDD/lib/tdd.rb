require "byebug"

class Array

  def remove_dups
    self.uniq
  end

  def two_sum
    arr = []
    (0...self.length - 1).each do |first|
      (first + 1..self.length - 1).each do |last|
        arr << [first, last] if self[first] + self[last] == 0
      end
    end
    arr
  end

  def my_transpose
    self.transpose
  end

  def stock_picker
    stock = [0, 0]
    (0...self.length - 1).each do |first|
      (first + 1..self.length - 1).each do |last|
        stock = [first, last] if self[last] - self[first] > self[stock[1]] - self[stock[0]]
      end
    end
    stock
  end

end
