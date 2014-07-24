require 'spec_helper'

describe MoviesController do
  describe "routes for movies" do
    it "routes get find movies whith same director" do
      expect(:get => "samedirector").to route_to(
        :controller => "movies",
        :action => "samedirector"
      )
    end
  end
  
  describe "links on pages" do
    let(:mov) { Movie.create(title:"Alien", director: "Ridley Scott")}
    it "looks for links at: movie detail page" do
      visit movie_path(mov) 
      expect(response).to have_link("Find Movies With Same Director", href: samedirector_path)
    end
  end
end
