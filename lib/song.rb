require "pry"
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

    song_name = self.new
    song_name.name = name

    song_name

  end
  def  self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
      res = self.all.find do |song|
          song.name.include?(name)
          end
    res
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)

  end

  def self.alphabetical

    self.all.sort_by {|song| song.name}

  end

  def self.new_from_filename(filename)

    parsed_name = filename.split('.')
    fileformat = parsed_name[-1]
    artistandname = parsed_name[0].split(' - ')
    #artistandname[0]  artist name
    song = self.new_by_name(artistandname[1])
    song.artist_name = artistandname[0]
    return song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    self.all.clear

  end

end
