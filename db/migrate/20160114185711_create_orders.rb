class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :placed_by
      t.text :shipping_to

      t.timestamps null: false
    end
  end
end
