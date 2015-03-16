class CartsController < ApplicationController
  def new
  	@cart = Cart.new
  end

  def show
  	@cart = Cart.find_by(id: $cart_id)
    all_products
  end

  def all_products
    @all = Item.where(cart_id: @cart.id).all
    
    @all2 = []
    @all.each do |x|
      unless @all.include?(x)
        @all2 << x
      end
    end
  end

  def funkti
    @indexes = []
  end


end
