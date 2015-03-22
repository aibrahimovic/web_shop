class CartsController < ApplicationController
  def new
  	#@cart = Cart.new
  end

  def show
    @all = @cart.items
  end

  def all_products
    if @current_user
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

  def update_item 
    is_updated = @cart.update_item(params[:item_id], params[:quantity])
    render json: { error: is_updated } 
  end

  def delete_item
    is_deleted = @cart.delete_item(params[:item_id])
    render json: { error: is_deleted } 
  end

  def update_price
    number, price, delivery, total = @cart.count_prices
    render json: { number: number, price: price, delivery: delivery, total: total } 
  end

end
