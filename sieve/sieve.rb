class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers = (2..@limit).to_a
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
