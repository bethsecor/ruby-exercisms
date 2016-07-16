class RailFenceCipher
  VERSION = 1

  def self.encode(message, rows)
    return message if message == '' || rows == 1 || message.length < rows

    if rows == 2
      encode_two(message)
    elsif rows == 3
      encode_three(message)
    elsif rows == 4
      encode_four(message)
    end
  end

  def self.decode(message, rows)
    return message if message == '' || rows == 1 || message.length < rows
    if rows == 2
      decode_two(message)
    elsif rows == 3
      decode_three(message)
    end
  end

  def self.encode_two(message)
    encoded = []
    encoded[0] = message.chars.select.with_index { |c, i| i.even? }
    encoded[1] = message.chars.select.with_index { |c, i| i.odd? }
    encoded.map(&:join).join('')
  end

  def self.encode_three(message)
    encoded = []
    encoded[0] = message.chars.select.with_index { |c, i| i == 0 || i % 4 == 0 }
    encoded[1] = message.chars.select.with_index { |c, i| i.odd? }
    encoded[2] = message.chars.select.with_index { |c, i| i % 2 == 0 && i % 4 != 0 }
    encoded.map(&:join).join('')
  end

  def self.encode_four(message)
    encoded = []
    encoded[0] = message.chars.select.with_index { |c, i| i == 0 || i % 6 == 0 }
    encoded[1] = message.chars.select.with_index { |c, i| i.odd? && i % 3 != 0 }
    encoded[2] = message.chars.select.with_index { |c, i| i.even? && i % 3 != 0 }
    encoded[3] = message.chars.select.with_index { |c, i| i % 3 == 0 && i % 2 != 0 }
    encoded.map(&:join).join('')
  end

  def self.decode_two(message)
    decoded = ""
    rail_one = message[0...message.length/2]
    rail_two = message[message.length/2...message.length]

    rail_one.chars.each_with_index do |rail_one_c, i|
      decoded << rail_one_c
      decoded << rail_two[i]
    end

    decoded
  end

  def self.decode_three(message)
    decoded = ""
    rail_one = message[0...message.length/3-1].chars
    rail_two = message[message.length/3-1...message.length/3*2+3].chars
    rail_three = message[message.length/3*2+3...message.length].chars

    until decoded.length == message.length do
      decoded << stringify(rail_one.shift)
      decoded << stringify(rail_two.shift)
      decoded << stringify(rail_three.shift)
      decoded << stringify(rail_two.shift)
    end

    decoded
  end

  def self.stringify(element)
    element.nil? ? "" : element
  end
end
