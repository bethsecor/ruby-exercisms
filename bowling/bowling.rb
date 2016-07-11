class Game
  attr_reader :score, :frame, :strike, :spare, :pins

  def initialize
    @score = 0
    @frame = 0
    @strike = []
    @spare = []
    @pins = 10
  end

  def roll(number_of_pins)
    @frame += 1
    @pins -= number_of_pins
    strike?(number_of_pins)
    spare?(number_of_pins)
    add_to_score(number_of_pins)
    @pins = 10 if @pins == 0
  end

  def add_to_score(number_of_pins)
    if !strike.empty? && [2,3].any? { |num| num == frame }
      @score += number_of_pins * 2
    elsif !spare.empty? && frame == 3
      @score += number_of_pins *  2
    else
      @score += number_of_pins
    end
  end

  def strike?(number_of_pins)
    if number_of_pins == 10
      @strike << frame
    end
  end

  def spare?(number_of_pins)
    if pins == 0
      @spare << frame
    end
  end
end
