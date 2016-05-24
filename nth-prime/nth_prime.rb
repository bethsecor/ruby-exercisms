class Prime
  def self.nth(number)
    if number < 1
      raise ArgumentError
    else
      primes(2 + number * 20)[number - 1]
    end
  end

  def primes(number)
    numbers = (2..number).to_a
    go_over_each(numbers)
  end

  def go_over_each(array)
    array.each do |num|
      remove_multiples(array, num)
    end
  end

  def remove_multiples(array, multiple)
    array.select! do |num|
      num == multiple || num % multiple != 0
    end
  end
end
