require ('spec_helper')

describe Movie do
  #it 'should include rating and year in full name' do
  #  movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
  #  movie.title_with_rating.should == 'Milk (R)'
  #end
  
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

  describe "searching imdb by keyword" do
    it "search imdb by keyword" do
      Imdb::Search.should_receive(:new).with("Inception")
      Movie.find_in_imdb('Inception')
    end
  end
end
