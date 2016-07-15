require 'pry'

class Alphametics
  def initialize
  end

  def solve(puzzle)
    puzzle = puzzle.gsub('^', '**')
    letters = puzzle.gsub(/[^A-Z]/, '').chars.uniq
    possibilities = (0..9).to_a.combination(letters.length).to_a.map do |comb|
      comb.permutation.to_a
    end.flatten(1)

    solution = nil
    i = 0
    until solution || i == possibilities.length do
      eval_this = true
      try = letters.zip(possibilities[i]).to_h
      puzzle_with_nums = puzzle.chars.map { |c| try[c] ? try[c] : c }.join('')

      puzzle_with_nums.split(' ').each do |e|
        if e =~ /[0-9]/ && e.to_i.to_s != e
          eval_this = false
        end
      end

      if eval_this && eval(puzzle_with_nums)
        solution = try
      end
      i += 1
    end
    solution
  end
end

module BookKeeping
  VERSION = 2
end
