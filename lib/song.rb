class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def initialize(name, artist_name)
  #   @name = name
  #   @artist_name = artist_name
  #   @@all << self
  # end

  def self.create
    song = Song.new
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    # song.save
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(string)
    self.all.find{|x| x.name == string}
  end

  def self.find_or_create_by_name(string)
    var = self.find_by_name(string)
    if var
    return var
    else
    self.create_by_name(string)
    end
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    parts = file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end


end
