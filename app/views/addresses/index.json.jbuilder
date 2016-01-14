json.array!(@addresses) do |address|
  json.extract! address, :id, :plot_no, :street, :locality, :city, :state, :pincode
  json.url address_url(address, format: :json)
end
