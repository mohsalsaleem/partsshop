require 'rails_helper'

RSpec.describe "product_reviews/index", type: :view do
  before(:each) do
    assign(:product_reviews, [
      ProductReview.create!(
        :review => "MyText",
        :rating => "9.99",
        :user_name => "User Name",
        :idea_id => 1
      ),
      ProductReview.create!(
        :review => "MyText",
        :rating => "9.99",
        :user_name => "User Name",
        :idea_id => 1
      )
    ])
  end

  it "renders a list of product_reviews" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
