require 'json'

class CartController < ApplicationController

  def items
    if cookies[:cart_items]
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
    			@cart_items[product.id.to_s] = [product.name,items[product.id.to_s],product.price]
    			@total_price += product.price
    		end
    	end
    else
      @cart_items = {}
    end
  	print @cart_items

  end
  def add
 		if cookies[:cart_items]
 			existing = JSON.parse(cookies[:cart_items])
 			if existing[params[:id].to_s]
 				existing[params[:id].to_s] += 1
 				cookies[:cart_items] = JSON.generate(existing)
 			else
 				existing[params[:id].to_s] = 1
 				cookies[:cart_items] = JSON.generate(existing)
 			end
 		else
 			cookies[:cart_items] = JSON.generate({ params[:id].to_s => 1})
 		end
	print JSON.parse cookies[:cart_items]
  	render nothing: true
  end
  
  def count
    if cookies[:cart_items]
      items = JSON.parse cookies[:cart_items]
      quantity = 0
      items.each do |item,value|
        quantity += value
      end
      render json: { count: quantity }
    else
      render json: { count: 0 }
    end
  end
end
