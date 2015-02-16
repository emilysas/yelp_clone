require 'rails_helper'

feature 'restaurants' do 
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurant added' do
    before do
      Restaurant.create(name: 'KFC')
    end

    scenario '' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants')
    end
  end
end