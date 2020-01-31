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
    @@all << song
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
    # BELOW ALSO WORKS (flatiron's sol'n)
    # self.all.detect{|song| song.name == name} ALSO WORKS
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)

    # BELOW ALSO WORKS (my original sol'n)
    # if !find_by_name(name)
    #   create_by_name(name)
    # else find_by_name(name)
    # end
  end

  def self.alphabetical
    @@all.sort_by! { |song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ").last.chomp(".mp3")
    song.artist_name = filename.split(" - ").first
    song

    # BELOW ALSO WORKS (flatiron's sol'n)
    # parts = filename.split(" - ")
    # artist_name = parts[0]
    # song_name = parts[1].gsub(".mp3", "")

    # song = self.create
    # song.name = song_name
    # song.artist_name = artist_name
    # song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ").last.chomp(".mp3")
    song.artist_name = filename.split(" - ").first
    @@all << song
    song

    # BELOW ALSO WORKS (flatiron's sol'n)
    # parts = filename.split(" - ")
    # artist_name = parts[0]
    # song_name = parts[1].gsub(".mp3", "")

    # song = self.create
    # song.name = song_name
    # song.artist_name = artist_name
    # song
  end

  def self.destroy_all
    @@all.clear
  end

end
