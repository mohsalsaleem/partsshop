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
          if items[product.id.to_s] > 0
    			 @cart_items[product.id.to_s] = [product.name,items[product.id.to_s],product.price*items[product.id.to_s],product.id]
    			 @total_price += product.price*items[product.id.to_s]
          end
    		end
    	end
    else
      @cart_items = {}
    end
  	 print @cart_items.to_json
    # render json: {data: "0"} 
     respond_to do |format|
      format.json { render json: { data: @cart_items.to_json } }
      format.html { render :items }
     end

  end

  def decrement_count
    puts params 
    existing =  JSON.parse(cookies[:cart_items])
    # print existing.class
    print "\n"
    # print params[:quantity]
    if existing[params[:product_id]] and params[:quantity].to_i > 0
      existing[params[:product_id]] = params[:quantity].to_i
      cookies[:cart_items] = JSON.generate(existing)
      print cookies[:cart_items]
      product = Product.find(params[:product_id])
      render json: { price: product.price*params[:quantity].to_i, notice: 1 }
    elsif params[:quantity].to_i == 0
      # h.tap { |hs| hs.delete(:a) 
      existing.tap { |ex| ex.delete(params[:product_id]) }
      # existing.delete([params[:product_id]])
      cookies[:cart_items] = JSON.generate(existing)
      render json: { notice: 0 }
    end
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
