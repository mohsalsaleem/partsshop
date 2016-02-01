class ProductReview < ActiveRecord::Base
	belongs_to :product
	after_save :update_product_rating

	private
		def update_product_rating
			rating_given = self.rating
			product = Product.find(self.product_id)
			product_rating = product.average_rating
			review_count = product.product_reviews.count
			new_rating = 0.0
			if review_count == 0
				new_rating = rating_given
			else
				new_rating = (product_rating + rating_given) / review_count
			end
			product.update(average_rating: new_rating)
			puts "Loooooook"
		end
end
