class Genre
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
end
