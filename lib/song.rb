require "pry"

class Song # make a class of SONG
    attr_accessor :name , :artist , :genre
    @@count = 0 #make counter
    @@artists = [] #make empty array
    @@genres = [] #make empty array

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre 
        @@count += 1 #makes counter to initialize each time to count the song
        @@artists << self.artist #pushes into the array the artists
        @@genres << self.genre #pushes into the array the genres
    end

    def self.count #class method
        @@count 
    end

    def self.artists #class method that calls the artist
        @@artists.uniq #make the array of artists uniq (no duplicates)
    end

    def self.genres #class method that malls the class variable, genres
        @@genres.uniq #make an array have uniq genres in the array (no duplicates)
    end

    def self.genre_count #make a class method

        @@genres.group_by{ |v| v }.map{ |k, v| [k, v.size] }.to_h #see below explanation
           
    end

    def self.artist_count #make class method

        @@artists.group_by{ |v| v }.map{ |k, v| [k, v.size] }.to_h #see below explanation
    end
    
end

=begin
Explanation for genre_count and artist_count:

data.group_by{ |v| v }.map{ |k, v| [k, v.size] }.to_h

broken down to :

-"data" is where you would put the variable
- .group by, groups the collection within the block and displays as a hash. This evvaluates the value of the hashes and calculates
- . map iterates then iterates theough the keys an dvalues (aka the artists and amount each)
- then puts each key, and calculate the size (or amount it appears) and display for each key
- to_h, makes it all into a hash

=end