class AddDefaultToOrderItems < ActiveRecord::Migration
  def change
  	change_column :orders, :order_items, :hstore, default: {}
  end
end
