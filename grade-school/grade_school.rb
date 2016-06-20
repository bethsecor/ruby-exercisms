class School
  def initialize
    @roster = {}
  end

  def to_h
    @roster.sort.to_h
  end

  def add(name, grade)
    if @roster[grade]
      @roster[grade] << name
      @roster[grade] = @roster[grade].sort
    else
      @roster[grade] = [name]
    end
  end

  def grade(number)
    return [] unless @roster[number]
    @roster[number]
  end
end

class BookKeeping
  VERSION = 1
end
