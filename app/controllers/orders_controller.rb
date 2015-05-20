class OrdersController < ApplicationController
	include SessionsHelper
	include ActionView::Helpers::NumberHelper

	def create
		order_items = params[:order_items]

		@order

		raise

		@order = Order.new
		@order.user_id = @current_user.id
		@order.total = 0

		raise

		order_items.each do |item| 
		    @order.order_item << item
		end

		#@order.add_order_items(order_items)

		@order.save

		redirect_to home_path
	end

	def show
		@orders = Order.all
	end

	def showOrder
		@order_id = params[:order]
		@order = Order.find_by(id: @order_id)
		@order_items = OrderItem.where(order_id: @order_id).all
		@total = 0
		@delivery = 0
		@order_items.each do |item|
			@total += item.price.to_f*item.quantity
			@delivery += item.quantity*5
		end

		@total = @total.to_s << "0"
    	@total = number_with_precision(@total, :precision => 2)
	end

end
