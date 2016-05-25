class Grains
  def self.square(number)
    2 ** (number - 1)
  end

  def self.total
    (1..64).to_a.map { |num| self.square(num) }.inject(:+)
  end
end
