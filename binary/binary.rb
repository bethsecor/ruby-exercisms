class Binary
  def initialize(binary_string)
    if binary_string.match(/[^01]/)
      raise ArgumentError
    end
    
    @binary_string = binary_string.chars.map(&:to_i)
  end

  def to_decimal
    exponents = (0..@binary_string.length-1).to_a
    powers_of_two = exponents.map { |num| 2 ** num }.reverse
    powers_of_two.zip(@binary_string).map{ |two, bin| two * bin }.inject(:+)
  end
end

class BookKeeping
  VERSION = 2
end
