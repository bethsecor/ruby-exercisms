class Array
  def keep
    results = []
    self.each do |element|
      results << element if yield(element)
    end
    results
  end

  def discard
    results = []
    self.each do |element|
      results << element if !yield(element)
    end
    results
  end
end
