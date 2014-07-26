require 'spec_helper'

  describe "routes for movies" do
    it "routes get find movies whith same director" do
      expect(:get => samedirector_path(1)).to route_to(
        :controller => "movies",
        :action => "samedirector",
        :id => "1"
      )
    end
  end
