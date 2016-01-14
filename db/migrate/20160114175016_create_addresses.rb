class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :plot_no, null: false
      t.string :street, null: false
      t.string :locality, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :pincode, null: false

      t.timestamps null: false
    end
  end
end
