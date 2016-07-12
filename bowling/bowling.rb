class Game
  def initialize
    @rolls = []
  end

  def roll(number_of_pins)
    if number_of_pins < 11
      @rolls << number_of_pins
    end
  end

  def score
    score = @rolls.reduce(&:+)
    strikes = @rolls.map.with_index { |n, i| n == 10 ? i : nil }.compact
    strikes.each do |i|
      score += @rolls[i+1,i+3].reduce(&:+)
    end
    score
  end
end

module BookKeeping
  VERSION = 1
end
