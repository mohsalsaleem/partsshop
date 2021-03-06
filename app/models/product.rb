class Product < ActiveRecord::Base
	has_attached_file :image, styles: { large: "300x160>", medium: "210x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :product_reviews
end
