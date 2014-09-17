class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :description, :release_date, :director

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_in_tmdb(string)
    #for imdb gem
    #Imdb::Search.new(string).movies[0,10]
    #for ruby-tmdb3
    Tmdb.api_key = "2f3341254894ad2cbbc5e4a21d7b51f9"
    TmdbMovie.find(:title => string, :limit => 10)
  end
  
  def director_movies
    Movie.find_all_by_director(self.director)
    
  end
end

