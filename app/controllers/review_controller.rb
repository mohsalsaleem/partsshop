class ReviewController < ApplicationController
  def order_items
  	user = current_user
  	@address = user.addresses.find(params[:address_id])
  	items = JSON.parse cookies[:cart_items]
  	# @items.each do |key,value|
  	# 	puts key + ":" + value.to_s
  	# end
  	items_to_find = []
  	items.each do |k,v|
  		items_to_find.push(k.to_i)
  	end

  	products = Product.find(items_to_find)

  	@cart_items = {}
  	@total_price = 0
  	products.each do |product|
  		if items.has_key?(product.id.to_s)
        if items[product.id.to_s] > 0
    			@cart_items[product.id.to_s] = [product.name,items[product.id.to_s],product.price]
    			@total_price += product.price
        end
  		end
  	end

  end
end
