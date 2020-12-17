class MusicLibraryController
  attr_accessor :library

  def initialize(path = './db/mp3s')
    @library = MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until answer=gets.chomp == 'exit'
    end
  end

  def list_songs
    @library.sort_by! {|song| song.split(/ - /)[1]}.each_with_index do |song, index|
      puts "#{index+1}. #{@library[index][0..-5]}"
    end
  end

  def list_artists
    artists = @library.map {|song| song.split(/ - /)[0]}.uniq.sort!
    artists.each_with_index {|artist, index| puts "#{index+1}. #{artist}"}
  end
end
