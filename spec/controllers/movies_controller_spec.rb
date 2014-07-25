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
  
  describe "GET samedirector" do
    #before (:each){get :samedirector, id: "1"}
    subject {get :samedirector, id: "1"}
    
    it "renders the samedirector template" do
      expect(subject).to render_template(:samedirector)
    end
    
    it "sends the correct params to controller" do
      #controller.stub(:params).and_return({"id"=>"1", "controller"=>"movies", 
      #"action"=>"samedirector"})
      get :samedirector, id: "1"
      expect(controller.params["id"]).to eq("1")
    end
    
    context "director info is pressent" do
      it "lets give this another name" do
        get :samedirector, id: "1"
        debugger
        expect(response.body).to be_empty
      end
    end

  
  end
end
