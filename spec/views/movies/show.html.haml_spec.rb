require 'spec_helper'

describe "movies/show.html.haml" do
  describe "links on pages" do
    #let!(:movie) {Movie.create(title:"Alien", director: "Ridley Scott", 
    #release_date: "12-06-1979") }
    it "looks for links at: movie detail page" do
      #view.instance_variable_set(@movie)
      #assign(:movie, Movie.create(title:"Alien", director: "Ridley Scott", 
      #  release_date: "12-06-1979"))
      #get :show, {:id => "#{mov.id}"}
      assign(:movie, create(:movie))
      render
      #debugger 
      expect(rendered).to have_link("Find Movies With Same Director", 
        href: samedirector_path(view_assigns[:movie]))
      
    end
  end
end
