class AddAverageRatingFieldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :average_rating, :decimal, default: 0
  end
end
