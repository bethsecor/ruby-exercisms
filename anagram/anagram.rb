class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.select do |possible_match|
      sort_letters(@word) == sort_letters(possible_match) &&
      @word.downcase != possible_match.downcase
    end
  end

  def sort_letters(word)
    word.downcase.chars.sort.join('')
  end
end
