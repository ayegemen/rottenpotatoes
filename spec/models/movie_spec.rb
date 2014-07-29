require ('spec_helper')

describe Movie do
  describe "searching Movie for same Director" do
    let!(:movie){create(:movie, title: "james bond", director: "tom jones")}
    
    it "movie object call same_director" do
      expect(movie.director_movies).to eq([movie])
    end
    
    it "is invalid without director atribute" do
      expect(movie.director).to_not be_blank
    end

    it "returns list of movies from same director" do
      movie2 = create(:movie, title: "gozilla", director: "tom jones")
      expect(movie.director_movies).to eq([movie, movie2])
    end
  end
end
