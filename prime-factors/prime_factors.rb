class PrimeFactors
  def self.for(number)
    divisor = 2
    divisors = []
    remainder = number

    while remainder > 1
      if remainder % divisor == 0
        divisors << divisor
        remainder = remainder / divisor
      else
        divisor += 1
      end
    end

    divisors
  end
end
