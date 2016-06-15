class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(ceiling_number)
    if ceiling_number < @multiples.min
      0
    else
      sum_multiples(ceiling_number)
    end
  end

  def sum_multiples(ceiling_number)
    numbers = (1...ceiling_number).to_a
    result = []

    @multiples.each do |multiple|
      result << numbers.select { |num| num % multiple == 0 }
    end

    result.flatten.uniq.reduce(:+)
  end
end
