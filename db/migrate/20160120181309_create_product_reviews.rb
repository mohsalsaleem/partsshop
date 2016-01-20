class CreateProductReviews < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.text :review
      t.decimal :rating
      t.string :user_name
      t.integer :idea_id

      t.timestamps null: false
    end
  end
end
