require 'pry'

class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    transposed.join('')
  end

  def normalize_ciphertext
    transposed.join(' ')
  end

  private

  def transposed
    chunk_size = size
    chunks = plaintext_segments.map do |s|
        Array.new(chunk_size) { |i| s[i] or '' }
    end
    chunks.transpose.map(&:join)
  end
end
