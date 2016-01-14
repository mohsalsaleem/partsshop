require 'rails_helper'

RSpec.describe ReviewController, type: :controller do

  describe "GET #order_items" do
    it "returns http success" do
      get :order_items
      expect(response).to have_http_status(:success)
    end
  end

end
