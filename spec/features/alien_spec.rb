require 'rails_helper'

RSpec.describe "Alien", :type => feature do
  # note to myself
  # let!(:obj){...} creates immediately and let(:obj){...} will only create obj when the obj is called. 
  # let is lazily evaluated, that is, obj won't come into existence till something is called upon it. 
  # let! helps out in sorting this issue by eagerly evaluating the block.
  # It's better to create obj manually w/o using factory girl when testing fill in the fields
  let!(:test_alien) { create(:alien) }

  feature 'View aliens' do        
    scenario 'allows viewing the list of all aliens' do
      visit "/"
      expect(page).to have_content 'Total count: 1'
      expect(page).to have_content test_alien.name
    end
  end

  feature 'Create an alien' do        
    scenario 'allows creating an alien' do
      visit "/"
      click_on "Add a New Alien"
      fill_in 'alien_name', :with => "New Alien Name"
      fill_in 'alien_year', :with => "9999"
      fill_in 'alien_month', :with => "99"
      fill_in 'alien_origin', :with => "New Alien Planet"
      click_on "Create Alien"
      expect(page).to have_content 'Total count: 2'
      expect(page).to have_content "New Alien Name"
    end
  end
  
  feature 'Edit an alien' do        
    scenario 'allows editing an alien' do
      visit "/"
      expect(page).to have_content 'Total count: 1'
      click_on "Edit"
      expect(page).to have_content "Edit Alien"
      fill_in 'alien_origin', :with => "Planet ABC"
      click_on "Update Alien"
      expect(page).to have_content "Planet ABC"
    end
  end
  
  feature 'Delete an Alien' do        
    scenario 'allows deleting an alien' do
      visit "/"
      expect(page).to have_content 'Total count: 1'
      click_on "Delete"
      expect(page).to have_no_content test_alien.name
      expect(page).to have_content 'Total count: 0'
    end
  end
end

