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


  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name  
    song 
  end

  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
      if song == nil 
        self.create_by_name(song_name)
      else
        song
      end
  end

  def self.alphabetical
    all.sort_by{|x| x.name}
  end


  def self.new_from_filename(filename)
    
    filename_split = filename.split(/ - |\./)
    artist_name = filename_split[0]
    name = filename_split[1]

    song = Song.new
      @name = name
      @artist_name = artist_name
      song.name=(name)
      song.artist_name=(artist_name)
      song
  end
 

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

  
end

