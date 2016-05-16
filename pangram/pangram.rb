class Pangram
  VERSION = 1
  
  def self.is_pangram?(string)
    alphabet = "abcdefghijklmnopqrstuvwxyz".chars
    string_lower = string.downcase
    letter_count = 0
    alphabet.each do |letter|
      letter_count += 1 if string_lower.include?(letter)
    end
    letter_count == 26
  end
end
