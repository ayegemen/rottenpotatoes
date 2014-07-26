require 'spec_helper'

describe MoviesController do
  #render_views
  let(:movie) { FactoryGirl.create(:movie) }
  let(:movie_list){[FactoryGirl.build(:movie), FactoryGirl.build(:movie,title: "yes man")]}
  
  describe "GET :samedirector" do
    #before :each do
    #movie.stub(:id).and_return('1')
    #Movie.stub(:find).and_return(movie)
    #get :samedirector, id: "1"
    #end

    it "responds successfully with an HTTP 200 status code" do
      get :samedirector, id: movie.id
      expect(response).to be_success
      expect(response.response_code).to eq(200)
    end
    
    it "renders the samedirector template" do
      get :samedirector, id: movie.id
      expect(response).to render_template(:samedirector)
    end
    
    it "sends the correct params to controller" do
      #controller.stub(:params).and_return({"id"=>"1", "controller"=>"movies", 
      #"action"=>"samedirector"})
      get :samedirector, id: movie.id
      expect(controller.params["id"]).to eq("1")
    end

    it "sets @movie to given param[:id]" do
      #movie = build(:movie, director: "james")
      #movie.stub(:id).and_return(1)
      #Movie.stub(:find).and_return(movie)
      #controller.stub(:params).and_return({"id"=>"1", "controller"=>"movies", 
      #  "action"=>"samedirector"})
      #get :samedirector, id: "1"
      #debugger
      Movie.should_receive(:find).with(movie.id.to_s).and_return(movie)
      get :samedirector, id: movie.id
      
      expect(assigns(:movie)).to eq(movie)
    end
  end  
  
  context "director info is pressent" do
    #before :each do
    #  
    #end
    
    it "checks that director field is set" do
      get :samedirector, id: movie.id
      expect(assigns(:movie).director).to_not be_blank
    end
      
      
    it "calls the find_by_director method of Movie" do
      Movie.stub(:find_all_by_director).with(movie.director).and_return(movie_list)
      Movie.should_receive(:find_all_by_director).with(movie.director).and_return(movie_list)
      get :samedirector, id: movie.id
     
      #debugger
      
      #expect(assigns(:simmov)).to eq(movie_list)
      #expect(Movie).to receive(:find_all_by_director).with(movie.director).and_return(movie_list)
      #  Movie.stub(:find_all_by_director).with(movie.director).and_return(movie_list)
    end   
  end
end

#it "loads up same directors" do
      #  get :samedirector, id: "1"
      #  #debugger
      #  expect(assigns(:same_dir_list)).to match_array(@fake_list)
      #end
