require 'rails_helper'

RSpec.describe "ProductReviews", type: :request do
  describe "GET /product_reviews" do
    it "works! (now write some real specs)" do
      get product_reviews_path
      expect(response).to have_http_status(200)
    end
  end
end
