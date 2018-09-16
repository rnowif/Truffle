class StandardTokenizer

  def tokenize(text)
    text.downcase
        .gsub(/[^[:word:]\s]/, ' ') # Replace sequences of non-alphanumerical chars by a single space
        .split
  end
end