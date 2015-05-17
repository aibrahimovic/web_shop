class CartsController < ApplicationController
  def new
  	#@cart = Cart.new
  end

  def show
    @all = @cart.items
    if @cart.items.length == 0
      @path_to_address = '#'
    else
      @path_to_address = find_address_path
    end
    @nuber_of_items = @cart.items.length

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
    number = @cart.items.length
    @counter = 0
    @cart.items.each do |item| 
      @counter += item.quantity
    end
    set_counter(@counter)
    #session[:counter] = totalNumber
    render json: { error: is_deleted, itemsNumber: number} 
  end

  def update_price
    number, price, delivery, total = @cart.count_prices
    @counter = 0
    @cart.items.each do |item| 
      @counter += item.quantity
    end
    session[:counter] = 0
    set_counter(@counter)
    #session[:counter] = totalNumber
    #puts 'Iz update-a: '+session[:counter].to_s
    render json: { number: number, price: price, delivery: delivery, total: total}  
  end

  def check_available
    products, product_names, quantities, items = @cart.check
    render json: { products: products, product_names: product_names, quantities: quantities, items: items }  
  end

end
