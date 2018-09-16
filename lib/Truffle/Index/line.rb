class Line
  attr_reader :file_name, :line_number, :text

  def initialize(file_name, line_number, text)
    @file_name = file_name
    @line_number = line_number
    @text = text
  end

  def ==(other_line)
    self.class == other_line.class &&
        @file_name == other_line.file_name &&
        @line_number == other_line.line_number &&
        @text == other_line.text
  end

  alias :eql? :==

  def hash
    [@file_name, @line_number, @text].hash
  end

  def to_s
    "<#{@file_name}> #{@line_number}: #{@text}"
  end
end