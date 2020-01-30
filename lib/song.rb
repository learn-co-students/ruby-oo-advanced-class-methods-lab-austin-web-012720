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
    return song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    return song
  end

  def self.find_by_name(song_name)
    @@all.find do |song| 
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if !self.find_by_name(song_name)
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = self.new
    clean_filename = filename.chomp(".mp3")
    split_filename = clean_filename.split(" - ")
    song.artist_name = split_filename[0]
    song.name = split_filename[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    clean_filename = filename.chomp(".mp3")
    split_filename = clean_filename.split(" - ")
    song.artist_name = split_filename[0]
    song.name = split_filename[1]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
