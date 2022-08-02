class ItemsController < ApplicationController

  def index
    @items = Customer.where(params[:supermarket_id])
    binding.pry
  end
end

# I got stuck trying to get a hold of the items through the 
# customers. I think this would be another instance where a 
# model method might have helped.