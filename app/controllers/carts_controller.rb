class CartsController < ApplicationController
  def new
  	@cart = Cart.new
  end

  def show
  	@cart = Cart.find(params[:id])
  	#@cart = Cart.find_by(params[:user_id])
  	all_products
  end

  def all_products
  	@all = Item.all
  	@list = []
  	@all.each do |x| 
  		if x.cart_id = @cart.id
  			@list << x.product_id
  		end
  	end
  end

end
