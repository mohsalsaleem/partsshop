require 'rails_helper'

RSpec.describe "product_reviews/show", type: :view do
  before(:each) do
    @product_review = assign(:product_review, ProductReview.create!(
      :review => "MyText",
      :rating => "9.99",
      :user_name => "User Name",
      :idea_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/1/)
  end
end
