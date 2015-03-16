class CartsController < ApplicationController
  def new
  	@cart = Cart.new
  end

  def show
    
    if $cart_id != nil
  	 @cart = Cart.find_by(id: $cart_id)
    else
      @cart = Cart.new
      @cart.user_id = 0
      @cart.save
      cookies[:cart_id] = @cart.id
      #$cart_id = cookies[:cart_id]
      @cart = Cart.find_by(id: @cart.id)
    end
    all_products
  end

  def all_products
    if logged_in?
      @all = Item.where(cart_id: @cart.id).all
    else
      @h_id = cookies[:cart_id]
      @all = Item.where(cart_id: @h_id).all
    end
    
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
