require File.dirname(__FILE__) + '/acceptance_helper'

feature "start a match", %q{
  In order to have a match
  As a player
  I want to create a match
  and add the players
} do
  
  background do
    create_4_players
  end
  
  scenario "Create and play a new match" do
    visit "/matches/new"
    page.should have_content('Create a new Match')
    
    fill_in "match_name", :with => "after meal match"
    select "Felipe", :from => "match_white_attacker_id"
    select "Dani",   :from => "match_white_goalkeeper_id"
    select "Toni",   :from => "match_red_attacker_id"
    select "Oscar",  :from => "match_red_goalkeeper_id"
    click_button "Start game"
    
    page.should have_content('0-0')
    page.should have_link('Felipe')
    page.should have_link('Dani')
    page.should have_link('Toni')
    page.should have_link('Oscar')

    click_link 'Felipe'
    page.should have_content('1-0')
    click_link 'Felipe'
    page.should have_content('2-0')
    click_link 'Toni'
    page.should have_content('2-1')
  end
  
end