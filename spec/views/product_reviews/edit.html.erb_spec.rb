require 'rails_helper'

RSpec.describe "product_reviews/edit", type: :view do
  before(:each) do
    @product_review = assign(:product_review, ProductReview.create!(
      :review => "MyText",
      :rating => "9.99",
      :user_name => "MyString",
      :idea_id => 1
    ))
  end

  it "renders the edit product_review form" do
    render

    assert_select "form[action=?][method=?]", product_review_path(@product_review), "post" do

      assert_select "textarea#product_review_review[name=?]", "product_review[review]"

      assert_select "input#product_review_rating[name=?]", "product_review[rating]"

      assert_select "input#product_review_user_name[name=?]", "product_review[user_name]"

      assert_select "input#product_review_idea_id[name=?]", "product_review[idea_id]"
    end
  end
end
