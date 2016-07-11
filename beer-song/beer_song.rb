require 'pry'

class BeerSong
  def initialize
  end

  def verse(number)
    general_verse(number)
  end

  def verses(stop, start)
    (start..stop).to_a.reverse.map do |verse_num|
      general_verse(verse_num)
    end.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  def general_verse(number)
    "#{number_bottles(number).capitalize} of beer on the wall, #{number_bottles(number)} of beer.\n" \
    "#{last_verse(number)}"
  end

  def number_bottles(number)
    if number > 1
      "#{number} bottles"
    elsif number == 1
      "1 bottle"
    else
      "no more bottles"
    end
  end

  def it_or_one(number)
    if number > 1
      "one"
    else
      "it"
    end
  end

  def last_verse(number)
    if number > 0
      "Take #{it_or_one(number)} down and pass it around, #{number_bottles(number-1)} of beer on the wall.\n"
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end

class BookKeeping
  VERSION = 2
end
