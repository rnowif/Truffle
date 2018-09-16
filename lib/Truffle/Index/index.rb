require 'Truffle/Index/search_result'

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
    unless @reverse_index.has_key? value.downcase
      return []
    end
    @reverse_index[value.downcase].group_by do |line|
      line.file_name
    end.each_pair.map do |file_name, lines|
      SearchResult.new(file_name, lines)
    end
  end
end