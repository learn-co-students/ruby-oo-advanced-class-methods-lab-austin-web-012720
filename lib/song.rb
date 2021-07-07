require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new 
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name) 
    @@all.find {|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name) 
  if song = self.find_by_name(name) 
   song
  else
      Song.create_by_name(name)
    end
  end

    def self.alphabetical 
      Song.all.sort! {|a,b| a.name <=> b.name}
    end

  def self.new_from_filename(filename)

    new_array = filename.split(" - ")
    artist_only  = new_array[0]
    song_only = new_array[1].gsub(".mp3", "")
 
    new_song = self.new
    new_song.name = song_only
    new_song.artist_name = artist_only 
    new_song
  end



  def self.create_from_filename(filename) 
    new_array = filename.split(" - ")
    artist_only  = new_array[0]
    song_only = new_array[1].gsub(".mp3", "")
 
    new_song = self.create
    new_song.name = song_only
    new_song.artist_name = artist_only 
    new_song
  end

  def self.destroy_all 
    @@all = []
  end
end