require 'pry'

class RunLengthEncoding
  def self.encode(string)
    letters = string.chars
    count = 0
    encoded = ""

    while !letters.empty? do
      letter = letters.shift
      count += 1

      if letter != letters[0]
        encoded << count.to_s if count > 1
        encoded << letter
        count = 0
      end
    end

    encoded
  end

  def self.decode(string)
    decoded = ""
    splits = string.split(/([0-9][0-9]+)|([0-9]+)/)

    if splits[0].empty?
      splits.shift
    else
      splits.unshift("1")
    end

    splits.each_slice(2).to_a.each do |count, letter|
      decoded << (letter[0] * count.to_i)
      decoded << letter[1..-1] if letter[1]
    end

    decoded
  end
end

class BookKeeping
  VERSION = 2
end
