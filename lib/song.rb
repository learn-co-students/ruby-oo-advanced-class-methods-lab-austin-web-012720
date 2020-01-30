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
    @@all << song
    song
  end 

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end 

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
   result = @@all.find{ |x| x.name == title}
   result
  end

  def self.find_or_create_by_name(title)
    
    if self.find_by_name(title)
      self.find_by_name(title)
    else 
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    #binding.pry
    all_songs = self.all.sort_by {|song| song.name}
    all_songs
  end 

  def self.new_from_filename(title)
    array = title.split(" - ")
    song_artist = array[0]
    array2 = array[1].split(".")
    song_name = array2[0]

    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song
  end
    
  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end
  
    def self.destroy_all
      self.all.clear
    end
    #binding.pry
    
  
end


Song.create_by_name("hello")
Song.create_by_name("hello1")
#new_song = Song.new_from_filename("Thundercat - For Love I Come.mp3")


#binding.pry
