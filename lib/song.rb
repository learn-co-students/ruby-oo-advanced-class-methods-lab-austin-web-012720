require 'pry'

class Song
  attr_accessor :name, :artist_name, :create
  @@all = []
  
  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(name_of_song)
    song = self.create
    song.name = name_of_song
    
    song
  end

  def self.find_by_name(name_of_song)
    @@all.find do |song_name|
      song_name.name == name_of_song
    end
  end

  def self.find_or_create_by_name(name_of_song)
    song1 = Song.find_by_name(name_of_song)

    if @@all.include?(song1)
      return song1
    else
      song1 = Song.create_by_name(name_of_song)
    end
  end
  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    split_song = filename.split('-')
    name_of_song = split_song[1].strip.gsub(".mp3", '')
    artist_name = split_song[0].strip
    
    song = self.create
    song.name = name_of_song
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split_song = filename.split('-')
    name_of_song = split_song[1].strip.gsub(".mp3", '')
    artist_name = split_song[0].strip

    song = self.create
    song.name = name_of_song
    song.artist_name = artist_name
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
