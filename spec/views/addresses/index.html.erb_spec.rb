require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :plot_no => "Plot No",
        :street => "Street",
        :locality => "Locality",
        :city => "City",
        :state => "State",
        :pincode => 1
      ),
      Address.create!(
        :plot_no => "Plot No",
        :street => "Street",
        :locality => "Locality",
        :city => "City",
        :state => "State",
        :pincode => 1
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Plot No".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Locality".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
