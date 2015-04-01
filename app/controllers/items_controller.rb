class ItemsController < ApplicationController

  def new
  	@item = Item.new    
  end

  def create
    @item = Item.new(item_params)
    @path_to_address = find_address_path
    @counter = session[:counter]

    hidden = params["hidden_buy_now"]
    if hidden == "1"
      @cart.add_item_to_temporary_cart(@item)
      redirect_to @path_to_address
    else
      is_saved = @cart.add_item(@item)
      hp = HelpProduct.find_by(id: @item.help_product_id)    
      if is_saved == true
        @counter += 1
        session[:counter] = @counter
      end
      redirect_to product_path(hp.product)
      
      #redirect_to :controller => 'products', :action => 'show', :id => hp.product, :counter => @counter
    end
  end

  def destroy

    set_order
    if !@current_user.nil?
      @order.user_id = @current_user.id
    else
      @order.user_id = 'guest'
    end
    @order.save

    @items = @cart.items.all
    @order_items = []
    
    @items.each do |item|
      @oi = OrderItem.new
      @oi.quantity = item.quantity
      @oi.help_product_id = item.help_product_id
      @oi.order_id = @order.id
      @oi.save()
    end


    if @cart!= nil
      @i = Item.where(cart_id: @cart.id).destroy_all
    else 
      @c = session[:cart_id]
      @i = Item.where(cart_id: @cart.id).destroy_all
    end
    return redirect_to home_path
  end

  def update
    redirect_to cart_path
  end

  
  def get_last_category 
  	p = Product.find (@item.product_id)	
  	return p.category_id
  end

  private
    def item_params
      params.require(:item).permit(:help_product_id, :quantity)
    end

end
