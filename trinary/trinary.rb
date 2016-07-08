class Trinary
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if @number =~ /[a-z4-9]/
    @number.chars.each_with_index.map do |num, i|
      num.to_i * 3 ** (@number.length - 1 - i)
    end.reduce(&:+)
  end
end

class BookKeeping
  VERSION = 1
end
