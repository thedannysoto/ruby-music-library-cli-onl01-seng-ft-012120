require 'pry'
class Artist
    extend Concerns::Findable
    attr_accessor :name

    @@all = [] 

    def initialize(name)
        @name = name 
        @songs = []
    end

    def self.all 
        @@all
    end

    def save
        @@all << self 
    end

    def self.create(name)
        artist = Artist.new(name)
        @@all << artist 
        artist 
    end

    def self.destroy_all
        @@all.clear
    end

    def songs
        @songs
    end

    def add_song(song)
        if song.artist == nil  
            song.artist = self
        end

        if !@songs.include?(song)
            @songs << song
        end

    end

    def genres
        @songs.map {|song| song.genre}.uniq     
    end
end