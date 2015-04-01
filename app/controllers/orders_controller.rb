class OrdersController < ApplicationController
	include SessionsHelper

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

end
