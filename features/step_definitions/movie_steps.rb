Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

Given /I have added "(.*)" with rating "(.*)"/ do |title, rating|
  steps %Q{
    Given I am on the Create New Movie page
    When  I fill in "Title" with "#{title}"
    And I select "#{rating}" from "Rating"
    And I press "Save Changes"
  }
end

Then /I should see "(.*)" before "(.*)"/ do |string1, string2|
  #regexp = /#{string1}.*#{string2}/m
  page.body.should =~ /#{string1}.*#{string2}/m
end


#When /^(?:|I )go to (.+) for "(.*)"$/ do |page, movie|
#  step "I go to #{page}"
#  m = Movie.find_by_title(movie) 
#  visit edit_movie_path(m.id)
#end

Then /^the director of "(.*?)" should be "(.*?)"$/ do |movie, director|
  m = Movie.find_by_title(movie)
  #m.director.should == director
  #print page.find('#details').find('Director').text #.count.should == value+1
  #page.has_selector?('li', :text => 'no more prob')
  d = page.find("#details li", :text => "Director").text
  d.should == ("Director: " + director)
  
end


