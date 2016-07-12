class Bst
  VERSION = 1
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(number)
    if number <= data
      left_node(number)
    elsif number > data
      right_node(number)
    end
  end

  def each
    left.each{ |d| yield(d) } if left
    yield(data)
    right.each{ |d| yield(d) } if right
  end

  def left_node(number)
    if left
      left.insert(number)
    else
      @left = Bst.new(number)
    end
  end

  def right_node(number)
    if right
      right.insert(number)
    else
      @right = Bst.new(number)
    end
  end
end
