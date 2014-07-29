require 'spec_helper'

describe "movies/samedirector.html.haml" do
  describe "samedirector page should show movies" do
    it "should show the title of the movie" do
      movie = create(:movie)
      assign(:dirmov, [movie])
      render
      expect(rendered).to include(movie.title)
    end
  end
end
