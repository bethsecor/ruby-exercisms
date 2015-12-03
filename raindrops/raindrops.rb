require 'prime'

# James Crockett contributed!
class Raindrops
  VERSION = 1
  def self.convert(number)
    factors = Prime.prime_division(number).flatten
    make_response(factors, number)
  end

  def self.make_response(factors, number)
    response = ""

    if [3,5,7].any? { |p| factors.include?(p) }
      response << "Pling" if factors.include?(3)
      response << "Plang" if factors.include?(5)
      response << "Plong" if factors.include?(7)
    else
      response << number.to_s
    end
    response
  end
end
