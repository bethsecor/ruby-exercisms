class Array
  def accumulate
    changed = []
    self.each do |element|
      changed << yield(element)
    end
    changed
  end
end
