require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :plot_no => "MyString",
      :street => "MyString",
      :locality => "MyString",
      :city => "MyString",
      :state => "MyString",
      :pincode => 1
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_plot_no[name=?]", "address[plot_no]"

      assert_select "input#address_street[name=?]", "address[street]"

      assert_select "input#address_locality[name=?]", "address[locality]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_pincode[name=?]", "address[pincode]"
    end
  end
end
