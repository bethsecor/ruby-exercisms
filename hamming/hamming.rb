class Hamming
  VERSION = 1
  def self.compute(string1, string2)
    raise ArgumentError unless string1.length == string2.length
    strands = string1.chars.zip(string2.chars)
    comparison = strands.map do |na1, na2|
      na1 == na2
    end
    comparison.count(false)
  end
end
