class CustomersController < ApplicationController
  def show
    @items = Item.where(params[:item_id])
    @customer = Customer.find(params[:id])
    @supermarket = Supermarket.find(@customer.supermarket_id)
    @total_price = @items.sum(:price).to_f / 100
  end
end

# I know this is ugly, and I most likely should have created a model
# method for this. But I am still trying to understand model methods
