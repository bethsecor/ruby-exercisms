class Clock
  attr_reader :minutes

  def initialize(minutes)
    @minutes = minutes
  end

  def self.at(hours, minutes)
    Clock.new(hours * 60 + minutes)
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end

  def to_s
    hour, minutes = @minutes.divmod(60)
    "#{format_hour(hour)}:#{format_minutes(minutes)}"
  end

  def +(min)
    Clock.new(@minutes += min)
  end

  def format_hour(number)
    if number < 0
      format_hour(number % 24)
    elsif number < 10
      "0#{number}"
    elsif number < 24
      number.to_s
    else
      format_hour(number - 24)
    end
  end

  def format_minutes(number)
    if number < 10
      "0#{number}"
    else
      number.to_s
    end
  end
end

module BookKeeping
  VERSION = 2
end
