require 'Truffle/version'
require 'Truffle/pattern_expander'
require 'optparse'

options = {
    :file_pattern => '*'
}

OptionParser.new do |opts|
  opts.banner = 'Usage: Truffle [options] dir1 dir2...'

  opts.on('-h', '--help', 'Display usage') do
    puts "Truffle version #{Truffle::VERSION}"
    puts opts
    exit
  end

  opts.on('-p PATTERN', '--pattern=PATTERN', 'File pattern (e.g. *.md)') do |pattern|
    options[:file_pattern] = pattern
  end
end.parse!

PatternExpander.new(ARGV, options[:file_pattern]).expand.each do |file_name|
  puts "Indexing file #{file_name}"
  File.open(file_name, 'r') do |f|
    f.each_line do |line|
      puts "#{f.lineno}: #{line}"
    end
  end
end

while true
  print '> '
  search = STDIN.gets.chomp

  # TODO compute search
  puts "Results for #{search}"
end