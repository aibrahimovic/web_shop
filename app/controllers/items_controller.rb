class ItemsController < ApplicationController

  def new
  	@item = Item.new   
  end

  def create
    parameter_hp = params[:item][:help_product_id]
    parameter_quantity = params[:item][:quantity]
    product_return = params["hidden_product_id"]

    if parameter_hp != ""
      
      @item = Item.new(item_params)
      @path_to_address = find_address_path
      @counter = cookies[:counter].to_i
      puts 'iz itemCreate:'+@counter.to_s

      hidden = params["hidden_buy_now"]
      if hidden == "1"
        @cart.add_item_to_temporary_cart(@item)
        redirect_to @path_to_address
      else
        is_saved = @cart.add_item(@item)
        hp = HelpProduct.find_by(id: @item.help_product_id)    
        if is_saved == true
          if !@item.quantity.nil?
            @counter += @item.quantity
          end
          #set_counter(@counter)
          cookies[:counter] = @counter
          puts 'iz itemCreate novi:'+cookies[:counter].to_s
        end

        redirect_to product_path(hp.product)
      end

    else 
      redirect_to product_path(product_return)
    end
  end

  def lock_product 
    

  end

  def destroy 

    shipping_address = params[:sh_address]
    billing_address = params[:bil_address]
    
    set_order
    if !@current_user.nil?
      @order.user_id = @current_user.id
      @order.email = @current_user.email
      @order.shipping_address_id = shipping_address
      @order.billing_address_id = billing_address
      @order.save
    else
      @order.email = 'guest'
      @order.shipping_address_id = shipping_address
      @order.billing_address_id = billing_address
      @order.save
    end

    #save order and quantity --
    ###if @order.save
      #all_items = @cart.items
      #all_items.each do |item| 
        #hp = HelpProduct.find_by(id: item.help_product_id)
        #hp.quantity = hp.quantity - item.quantity
        #hp.save
      #end
    #end

    temp_item = Item.find_by(tag: 0)
    #saving orderitems and order
    if temp_item.nil?

      @items = @cart.items.all
      @order_items = []
      
      @items.each do |item|
        @oi = OrderItem.new
        @oi.quantity = item.quantity
        @oi.help_product_id = item.help_product_id
        @oi.price = item.price
        @oi.order_id = @order.id
        @oi.save()
      end

      if @cart!= nil
        @i = Item.where(cart_id: @cart.id).destroy_all
        session[:counter] = 0
      else 
        @c = session[:cart_id]
        @i = Item.where(cart_id: @cart.id).destroy_all
        session[:counter] = 0
      end
    else
      @oi = OrderItem.new
      @oi.quantity = temp_item.quantity
      @oi.help_product_id = temp_item.help_product_id
      @oi.price = item.price
      @oi.order_id = @order.id
      @oi.save()
      temp_item.delete()
    end

    return redirect_to order_path(order: @order.id)
  end

  def update
    redirect_to cart_path
  end

  def get_last_category 
  	p = Product.find (@item.product_id)	
  	return p.category_id
  end

  def delete_temp_items
    temp_items = Item.where(tag: 0).destroy_all
    is_deleted = true
    render json: { error: is_deleted } 
  end

  private
    def item_params
      params.require(:item).permit(:help_product_id, :quantity)
    end

end
