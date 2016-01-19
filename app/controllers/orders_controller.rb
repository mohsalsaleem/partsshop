require 'json'
class OrdersController < ApplicationController

	before_action :authenticate_anyone?

	def index
		if current_user
			@orders = Order.all.paginate(page: params[:page], per_page: 10).where(placed_by: current_user.email)
		elsif current_admin
			@orders = Order.all.paginate(page: params[:page], per_page: 10)
		end
	end

	def archived_orders
		if current_admin
			@orders = Order.all.where(archived: true).paginate(page: params[:page], per_page: 10)
		end
	end

	def show
	 	@order = Order.find(params[:id])
		items = @order.order_items
	  	items_to_find = []
	  	items.each do |k,v|
	  		items_to_find.push(k.to_i)
	  	end

	  	products = Product.find(items_to_find)

	  	@order_items = {}
	  	@total_price = 0
	  	products.each do |product|
	  		if items.has_key?(product.id.to_s)
	  			@order_items[product.id.to_s] = [product.name,items[product.id.to_s],product.price]
	  			@total_price += product.price
	  		end
	  	end
	end

	def create
		items = JSON.parse cookies[:cart_items]
		user = current_user
		address = user.addresses.find(params[:address_id])
		# print items.class
		shipping_to = address.name+', '+address.phone_number+', '+address.street+', '+address.locality+', '+address.city+', '+address.state+', '+address.pincode.to_s 
		order = Order.new(placed_by: current_user.email, shipping_to: shipping_to, order_items: items)
		if order.save
			cookies[:cart_items] = JSON. generate({})
			redirect_to order, notice: 'Order was successfully places'
		else
			redirect_to products_path, notice: 'Something went wrong, please contact the team'
		end
	end

	def destroy
		order = Order.find(params[:order_id])
		order.destroy
		redirect_to orders_path, notice: 'Order was successfully destroyed.'
	end

	def archive
		order = Order.find(params[:order_id])
		if order.update(archived: true)
			redirect_to orders_path, notice: 'Order was successfully archived'
		else
			redirect_to order_id, notice: 'Something went wrong'
		end
	end

	def dispatch_order
		order = Order.find(params[:order_id])
		if order.update(dispatched: true)
			redirect_to orders_path, notice: 'Order was successfully dispatched'
		else
			redirect_to order_id, notice: 'Something went wrong'
		end
	end

	def confirm
		if Order.find(params[:order_id]).update(status: true)
			redirect_to orders_path, notice: "Order was updated"
		else
			redirect_to order_path, notice: "Something went wrong"
		end
	end
	def deny
		Order.find(params[:order_id]).update(status: false)
		render nothing: true
	end
end
