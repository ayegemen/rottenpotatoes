require 'spec_helper'

describe MoviesController do
  #render_views
  describe "routes for movies" do
    it "routes get find movies whith same director" do
      expect(:get => samedirector_path(1)).to route_to(
        :controller => "movies",
        :action => "samedirector",
        :id => "1"
      )
    end
  end
  
  

  describe "GET #samedirector" do
    subject {get :index}
    
    it "renders the samedirector template" do
      expect(subject).to render_template(:samedirector)
    end
  end
end
