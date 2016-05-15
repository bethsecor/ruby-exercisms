require 'pry'

class Fixnum
  VERSION = 1

  def roman_num_dictionary
    { 1 => 'I', 4 => 'IV',
      5 => 'V', 9 => 'IX',
      10 => 'X', 40 => 'XL',
      50 => 'L', 90 => 'XC',
      100 => 'C', 400 => 'CD',
      500 => 'D', 900 => 'CM',
      1000 => 'M' }
  end

  def to_roman
    number = self
    roman = ""
    roman_num_dictionary.to_a.reverse.each_with_index do |(num, rom), i|
      thing = number / num
      if thing == 0
        roman += rom * (thing)
      else
        if thing % 9 == 0
          roman += rom + roman_num_dictionary.to_a.reverse[i-2][1]
        elsif thing % 4 == 0
          roman += rom + roman_num_dictionary.to_a.reverse[i-1][1]
        else
          roman += rom * (thing)
        end
      end
      number = number % num
    end
    roman
  end
end
