class AddReferenceFromItemsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :item, foreign_key: true
  end
end
