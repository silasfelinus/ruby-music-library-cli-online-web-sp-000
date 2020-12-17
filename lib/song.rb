class Song
  attr_accessor :name, :artist_object, :genre_object, :artist_string, :genre_string
  attr_reader :artist, :genre
  @@all = []
  extend Concerns::Findable

  def initialize (name, artist_object = nil, genre_object = nil)
    @name = name
    if artist_object != nil
      self.artist = artist_object
    end
    if genre_object != nil
      self.genre = genre_object
    end
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    song_name = filename.split(/ - /)[1]
    artist_name = filename.split(/ - /)[0]
    genre_name = filename.split(/ - /)[2][0..-5]
    artist_object = Artist.find_or_create_by_name(artist_name)
    genre_object = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist_object, genre_object)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

end
