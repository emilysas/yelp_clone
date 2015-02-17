require 'rails_helper'

feature 'reviewing' do 

  before {Restaurant.create name: 'KFC'}

  scenario 'allows user to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: "Rating"
    click_button "Leave Review"
    expect(page).to have_content "so so"
    expect(current_path).to eq('/restaurants')
  end

  scenario 'if a user deletes a restaurant, the reviews will also be deleted' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: "Rating"
    click_button "Leave Review"
    click_link "Delete KFC"
    expect(page).not_to have_content "so so"
    expect(current_path).to eq('/restaurants')
  end
  
end