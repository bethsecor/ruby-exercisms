class Complement
  VERSION=2
  def self.of_dna(string)
    unless string.chars.all? { |char| ['A', 'T', 'G', 'C'].include?(char) }
      raise ArgumentError
    end
      string.gsub!('A', 'U')
      string.gsub!('T', 'A')
      string.gsub!('G', 'Z')
      string.gsub!('C', 'G')
      string.gsub!('Z', 'C')
      string
  end

  def self.of_rna(string)
    unless string.chars.all? { |char| ['U', 'A', 'G', 'C'].include?(char) }
      raise ArgumentError
    end
    string.gsub!('A', 'T')
    string.gsub!('U', 'A')
    string.gsub!('G', 'Z')
    string.gsub!('C', 'G')
    string.gsub!('Z', 'C')
    string
  end
end

class ArgumentError < StandardError
end
