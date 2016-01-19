class AddDispatchedFieldToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :dispatched, :boolean, default: false
  end
end
