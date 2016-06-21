class Series
  def initialize(sequence)
    @sequence = sequence
  end

  def slices(length)
    raise ArgumentError if length > @sequence.length
    
    results = []
    for i in 0..@sequence.length-length
      results << @sequence[i, length].chars.map(&:to_i)
    end
    results
  end
end
