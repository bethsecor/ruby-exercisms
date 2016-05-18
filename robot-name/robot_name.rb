TAKEN_NAMES = []

class Robot
  VERSION = 1
  attr_reader :name

  def initialize
    create_name
  end

  def reset
    TAKEN_NAMES.delete(@name)
    create_name
  end

  def create_name
    name = generate_name
    if TAKEN_NAMES.include?(name)
      create_name
    else
      TAKEN_NAMES << name
      @name = name
    end
  end

  def generate_name
    letters = ('A'..'Z').to_a
    numbers = (0..9).to_a
    name = ""
    2.times { name << letters.sample }
    3.times { name << numbers.sample.to_s }
    name
  end
end
