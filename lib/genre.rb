class Genre 
  attr_accessor :name 
  @@all = [] 
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
  def songs 
    Song.all.select do |song|
      song.genre = self 
    end 
  end 
  def artists
    artistArr = []
    songs.select do |song|
      if !(artistArr.include?(song.artist))
        artistArr << song.artist 
      end 
    end 
    artistArr
  end 
end 