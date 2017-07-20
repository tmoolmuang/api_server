require 'rails_helper'

RSpec.describe "Power", :type => feature do
  let!(:test_alien) { create(:alien) }
  let!(:test_power) { create(:power, alien: test_alien) }

  feature 'View powers' do        
    scenario 'allows viewing the list of all powers' do
      visit "/aliens"
      click_on "Show"
      expect(page).to have_content 'Power count: 1'
      expect(page).to have_content test_power.ability
    end
  end

  feature 'Create power' do        
    scenario 'allows creating power' do
      visit "/aliens"
      click_on "Show"
      click_on "Add a New Power"
      fill_in 'power_ability', :with => "New Power"
      click_on "Create Power"
      expect(page).to have_content 'Power count: 2'
      expect(page).to have_content "New Power"
    end
  end
  
  feature 'Edit power' do        
    scenario 'allows editing power' do
      visit "/aliens"
      click_on "Show"
      expect(page).to have_content 'Power count: 1'
      click_on "Edit"
      expect(page).to have_content "Edit Power for " + test_alien.name
      fill_in 'power_ability', :with => "Newer Power"
      click_on "Update Power"
      expect(page).to have_content "Newer Power"
      expect(page).to have_content 'Power count: 1'
    end
  end
  
  feature 'Delete power' do        
    scenario 'allows deleting power' do
      visit "/aliens"
      click_on "Show"
      expect(page).to have_content 'Power count: 1'
      click_on "Delete"
      expect(page).to have_no_content test_power.ability
      expect(page).to have_content 'Power count: 0'
    end
  end
end
