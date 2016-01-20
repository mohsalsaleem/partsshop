class RenameIdeaIdToProductIdInProductReviews < ActiveRecord::Migration
  def change
  	rename_column :product_reviews, :idea_id, :product_id
  end
end
