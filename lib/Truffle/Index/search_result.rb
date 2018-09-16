class SearchResult
  attr_reader :file_name, :lines

  def initialize(file_name, lines)
    @file_name = file_name
    @lines = lines
  end

  def to_s
    printed_lines = @lines.map do |line|
      "#{line.line_number}: #{line.text}"
    end
    "<#{@file_name}>\n #{printed_lines}"
  end
end