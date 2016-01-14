class AddOrderStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :state, :boolean, default: nil
  end
end
