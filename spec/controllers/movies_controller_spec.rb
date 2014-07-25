require 'spec_helper'

describe MoviesController do
  #render_views
  let(:movie) { FactoryGirl.build(:movie) }
  
  before :each do
    movie.stub(:id).and_return('1')
    Movie.stub(:find).and_return(movie)
    get :samedirector, id: "1"
  end
  
  describe "routes for movies" do
    it "routes get find movies whith same director" do
      expect(:get => samedirector_path(1)).to route_to(
        :controller => "movies",
        :action => "samedirector",
        :id => "1"
      )
    end
  end
  
  describe "GET :samedirector" do
    #before (:each){get :samedirector, id: "1"}
    #subject {get :samedirector, id: "1"}
    
    it "renders the samedirector template" do
      expect(response).to render_template(:samedirector)
    end
    
    it "sends the correct params to controller" do
      #controller.stub(:params).and_return({"id"=>"1", "controller"=>"movies", 
      #"action"=>"samedirector"})
      #get :samedirector, id: "1"
      expect(controller.params["id"]).to eq("1")
    end

    it "sets movie to given param" do
        #movie = build(:movie, director: "james")
        #movie.stub(:id).and_return(1)
        #Movie.stub(:find).and_return(movie)
        #controller.stub(:params).and_return({"id"=>"1", "controller"=>"movies", 
        #  "action"=>"samedirector"})
        #get :samedirector, id: "1"
        #debugger
        expect(assigns(:movie)).to eq(movie)
      end
    
    context "director info is pressent" do
      #before :each do
      #  @fake_list = [create(:movie, director: "james"), create(:movie, director: "james")]
      #end
      it "checks for director info in movie" do
        expect(movie.director).to_not be_blank
      end
      
      
      it "calls the find_by_director method of Movie" do
        Movie.should_receive(:find_all_by_director).with("james").and_return([movie])
      #  get :samedirector, id: "1"
      end   
    end
  end
end

#it "loads up same directors" do
      #  get :samedirector, id: "1"
      #  #debugger
      #  expect(assigns(:same_dir_list)).to match_array(@fake_list)
      #end
