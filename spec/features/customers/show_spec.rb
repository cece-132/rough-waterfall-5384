require 'rails_helper'

RSpec.describe Customer do
  describe 'User#Story#One' do
    it 'can visit show page'do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")

      customer = Customer.create!(name: "Patty", supermarket_id: supermarket.id)

      item = Item.create!(name: "Snickers", price: 100, customer_id: customer.id)
      item2 = Item.create!(name: "Twix", price: 200, customer_id: customer.id)
      item3 = Item.create!(name: "3 Musketeers", price: 300, customer_id: customer.id)

      visit customer_path(customer)
    end

    it 'can view a list of items' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")

      customer = Customer.create!(name: "Patty", supermarket_id: supermarket.id)
      
      item = Item.create!(name: "Snickers", price: 100, customer_id: customer.id)
      item2 = Item.create!(name: "Twix", price: 200, customer_id: customer.id)
      item3 = Item.create!(name: "3 Musketeers", price: 300, customer_id: customer.id)

      visit customer_path(customer)

      expect(page).to have_content("Snickers")
      expect(page).to have_content("Twix")
      expect(page).to have_content("3 Musketeers")

    end
    it 'shows the item name and supermarket it belongs to' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")

      customer = Customer.create!(name: "Patty", supermarket_id: supermarket.id)
      
      item = Item.create!(name: "Snickers", price: 100, customer_id: customer.id)
      item2 = Item.create!(name: "Twix", price: 200, customer_id: customer.id)
      item3 = Item.create!(name: "3 Musketeers", price: 300, customer_id: customer.id)

      visit customer_path(customer)

      within(".item-#{item.id}") do
        expect(page).to have_content("Snickers")
        expect(page).to have_content("Target Supermarket")
      end

      within(".item-#{item2.id}") do
        expect(page).to have_content("Twix")
        expect(page).to have_content("Target Supermarket")
      end

      within(".item-#{item3.id}") do
        expect(page).to have_content("3 Musketeers")
        expect(page).to have_content("Target Supermarket")
      end
    end
  end

  describe 'User#Story#Two' do
    it 'shows the total price of all of the items' do
      supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")
      
      customer = Customer.create!(name: "Patty", supermarket_id: supermarket.id)
      
      item = Item.create!(name: "Snickers", price: 100, customer_id: customer.id)
      item2 = Item.create!(name: "Twix", price: 200, customer_id: customer.id)
      item3 = Item.create!(name: "3 Musketeers", price: 300, customer_id: customer.id)

      visit customer_path(customer)

      expect(page).to have_content("Total Cost: $6.00")
    end
  end
end

# supermarket = Supermarket.create!(name: "Target Supermarket", location: "Westminster")
# supermarket2 = Supermarket.create!(name: "Walmart Supermarket", location: "Denver")
# supermarket3 = Supermarket.create!(name: "Farmer's Supermarket", location: "Aurora")


# customer = Customer.create!(name: "Patty", supermarket_id: supermarket.id)

# item = Item.create!(name: "Snickers", price: 100, customer_id: customer.id)
# item2 = Item.create!(name: "Twix", price: 200, customer_id: customer.id)
# item3 = Item.create!(name: "3 Musketeers", price: 300, customer_id: customer.id)