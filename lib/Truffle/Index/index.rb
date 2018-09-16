class Index

  def initialize(tokenizer)
    @reverse_index = {}
    @tokenizer = tokenizer
  end

  def add(line)
    @tokenizer.tokenize(line.text).each do |token|
      unless @reverse_index.has_key? token
        @reverse_index[token] = []
      end

      @reverse_index[token].push(line)
    end
  end

  def search(value)
    @reverse_index[value.downcase]
  end
end