require 'Truffle/version'
require 'optparse'

def files(directories, file_pattern)
  directories.map do |directory|
    files_to_index = File.join(directory, '**', file_pattern)
    Dir.glob(files_to_index, File::FNM_DOTMATCH).reject do |file|
      File.directory?(file)
    end
  end.flatten
end

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

files(ARGV, options[:file_pattern]).each do |file|
  # TODO index file
  puts "Indexing file #{file}"
end

while true
  print '> '
  search = STDIN.gets.chomp

  # TODO compute search
  puts "Results for #{search}"
end