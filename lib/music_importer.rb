class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    binding.pry
    Dir.entries(@path).each {|file| file }[0..-3]
  end

  def import
    files.each { |filename| Song.create_from_filename(filename)}
  end



end
