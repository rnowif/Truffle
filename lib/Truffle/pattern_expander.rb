class PatternExpander
  def initialize(directories, file_pattern)
    @directories = directories
    @file_pattern = file_pattern
  end

  # Give the list of files that match the pattern in the given base directories
  # Files are searched recursively
  def expand
    @directories.map do |directory|
      files_to_index = File.join(directory, '**', @file_pattern)
      Dir.glob(files_to_index, File::FNM_DOTMATCH).reject do |file|
        File.directory?(file)
      end
    end.flatten
  end
end

