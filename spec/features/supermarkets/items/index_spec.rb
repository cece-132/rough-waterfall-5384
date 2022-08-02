require 'rails_helper'

RSpec.describe Supermarket do
  describe 'User#Story#Three' do
    it 'has a route to index page' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")
      
      visit supermarket_path(supermarket)
      click_link "View Items"

      expect(current_path).to eq(supermarket_items_path(supermarket))
    end

    it 'supermarket items are listed uniquely' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")

      customer = Customer.create!(name: "Patty", supermarket_id: supermarket.id)

      item = Item.create!(name: "Snickers", price: 100, customer_id: customer.id)
      item2 = Item.create!(name: "Twix", price: 200, customer_id: customer.id)
      item3 = Item.create!(name: "3 Musketeers", price: 300, customer_id: customer.id)
      item4 = Item.create!(name: "Snickers", price: 100, customer_id: customer.id)
      
      visit supermarket_items_path(supermarket)

      within("#items")do
        expect(page).to have_content(item.name)
        expect(page).to have_content(item2.name)
        expect(page).to have_content(item3.name)
        expect(page).to_not have_content(item4.name)
      end
    end
  end
end