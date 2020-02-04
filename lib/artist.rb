class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def name= (name)
        @name = name
    end

    def songs
        Song.all.select {|s| s.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        songs.each{ |s| puts s.name }
    end

    def self.find_or_create_by_name(n)
        if @@all.find{|a| a.name == n}
            @@all.find{|a| a.name == n}
        else
            Artist.new(n)
        end
    end

    def self.find(name)
        @@all.find { |artist| artist.name == name}
    end 

    def self.all 
        @@all
    end
end