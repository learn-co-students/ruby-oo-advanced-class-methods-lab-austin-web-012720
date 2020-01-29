class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create()
    s = Song.new
    @@all << s
    return s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
    return s
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)

    self.all.detect{|s| s.name == song_name}

  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
      return self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(file)
    a = file.split("-")
    a[1] = a[1].gsub(".mp3","")[1..-1]
    song = self.new_by_name(a[1])
    song.artist_name = a[0][0...-1]
    return song

  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end


  def self.destroy_all
    @@all.clear
  end

end
