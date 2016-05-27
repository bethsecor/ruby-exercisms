class Phrase
  VERSION = 1

  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    count = {}
    words = @phrase.gsub(/[^a-z0-9']/, ' ')
                   .gsub(" '", ' ')
                   .gsub("' ", ' ')
                   .split(' ')
    words.each do |word|
      if count[word]
        count[word] += 1
      else
        count[word] = 1
      end
    end
    count
  end
end
