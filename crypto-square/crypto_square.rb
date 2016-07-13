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
    ciphered = ""
    segments = plaintext_segments
    segments.first.length.times do |n|
      segments.each do |segment|
        ciphered << segment[n] if segment[n]
      end
    end
    ciphered
  end

  def normalize_ciphertext
  end
end
