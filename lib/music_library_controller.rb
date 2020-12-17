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
    artists = Artist.all.map {|artist| artist.name}.sort.uniq
    artists.each_with_index {|artist, index| puts "#{index+1}. #{artist}"}
  end

  def list_genres
    genres = Genre.all.map {|genre| genre.name}.sort.uniq
    genres.each_with_index {|genre, index| puts "#{index+1}. #{genre}"}
  end

#
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    songs = Song.all.select {|song| song.artist.name == artist}.map {|song| "#{song.name} - #{song.genre.name}"}.sort
    songs.each_with_index {|song, index| puts "#{index+1}. #{song}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    songs = Song.all.select {|song| song.genre.name == genre}.map {|song| "#{song.artist.name} - #{song.name}"}
    songs.each_with_index {|song, index| puts "#{index+1}. #{song}"}

  end


  def play_song

  end

end
