class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    item = Item.find(params[:item_id])
    old_qunantity = item.quantity
    
    is_updated = @cart.update_item(params[:item_id], params[:quantity])
    
    quantity = params[:quantity]
    @counter = session[:counter]
    puts 'iz prvi update:'+@counter.to_s
    
    if quantity.to_i > old_qunantity.to_i
      puts 'counter_prije: '+@counter.to_s
      puts 'Stara: '+old_qunantity.to_s
      puts 'Nova: '+quantity.to_s
      #@counter = (@counter.to_i - old_qunantity.to_i) + quantity.to_i
      puts 'counter_nakon: '+@counter.to_s
      #session[:counter] = @counter
    else
      puts 'counter_prije: '+@counter.to_s
      puts 'Stara: '+old_qunantity.to_s
      puts 'Nova: '+quantity.to_s
      #@counter = @counter.to_i - (old_qunantity.to_i - quantity.to_i)
      puts 'counter_nakon: '+@counter.to_s
      #session[:counter] = @counter
    
    end
    
    session[:counter] = 100
    render json: { error: is_updated, counter: @counter}
  end
  

  def delete_item
    item = Item.find(params[:item_id])
    old_qunantity = item.quantity
    
    is_deleted = @cart.delete_item(params[:item_id])
    
    number = @cart.items.length
    @counter = session[:counter]
    @counter = @counter.to_i - old_qunantity.to_i
    session[:counter] = @counter
    
    render json: { error: is_deleted, itemsNumber: number, counter: @counter}
  end

  def update_price
    number, price, delivery, total = @cart.count_prices
    render json: { number: number, price: price, delivery: delivery, total: total}  
  end

  def check_available
    products, product_names, quantities, items = @cart.check
    render json: { products: products, product_names: product_names, quantities: quantities, items: items }  
  end

end
