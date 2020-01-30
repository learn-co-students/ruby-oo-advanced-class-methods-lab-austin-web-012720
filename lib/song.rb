require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
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
    @@all.select { |song| song.name == name }[0]
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(file)
    song = self.new
    split = file.split(' - ')
    name = split[1].sub('.mp3', '')
    artist = split[0]
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song = self.new
    split = file.split(' - ')
    name = split[1].sub('.mp3', '')
    artist = split[0]
    song.name = name
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
