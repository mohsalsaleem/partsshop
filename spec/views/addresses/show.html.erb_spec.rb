require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :plot_no => "Plot No",
      :street => "Street",
      :locality => "Locality",
      :city => "City",
      :state => "State",
      :pincode => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Plot No/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Locality/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/1/)
  end
end
