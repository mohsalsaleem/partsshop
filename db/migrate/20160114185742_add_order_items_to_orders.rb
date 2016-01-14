class AddOrderItemsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :order_items, :hstore
  end
end
