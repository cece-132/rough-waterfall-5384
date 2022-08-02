require 'rails_helper'

RSpec.describe Supermarket do
  describe 'User#Story#Three' do
    it 'has a route to show page' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")
      
      visit supermarket_path(supermarket)
    end

    it 'shows the supermarket by name' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")
      
      visit supermarket_path(supermarket)

      expect(page).to have_content("Target Supermarket")
    end
    
    it 'has link to view supermarket items' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")
      
      visit supermarket_path(supermarket)

      expect(page).to have_link("View Items")
    end
  end
end