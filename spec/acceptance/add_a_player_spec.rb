require File.dirname(__FILE__) + '/acceptance_helper'

feature "Players in the system" do
  
  scenario "see the current player register in the application" do
    Factory(:player)

    visit "/players/"
    page.should have_content('Players list')
    page.all('//li').should have(1).elements
    page.should have_content('Felipe')
  end
  
  scenario "Adding a new player" do
    Factory(:player)
    visit "/players"
    
    page.all('//li').should have(1).elements
    page.should have_content('Felipe')
    
    fill_in "player_name", :with => "Toni Martín"
    fill_in "player_email", :with => "test@test.com"
    click_button "Add"
    
    page.all('//li').should have(2).elements
    page.should have_content('Felipe')
    page.should have_content('Toni Martín')
  end
  
end