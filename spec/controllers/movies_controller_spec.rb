require 'spec_helper'

describe MoviesController do
  describe "routes for similar movies" do
    it "routes get find movies whith same director" do
      expect(:get => "samedirector").to route_to(
        :controller => "movies",
        :action => "samedirector"
      )
    end
  end
end
