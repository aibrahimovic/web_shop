class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create

    @item = Item.new(item_params)
    tag = false

    #way to send help_product_id from previous form
    @id_product = @item.help_product_id
    hp = HelpProduct.where(product_id: @item.help_product_id).all
    hp.each do |x| 
      if x.size == @item.size
        @item.help_product_id = x.id
      end
    end

    @item.product_id = @id_product

    #product is not in table items
    if tag == false
      if @item.save
          redirect_to product_path(@id_product)
          #redirect_to items_new_path
          #dodati broj na korpu u desnom čošku
      else
        render 'new'
      end
    end
  end


  def destroy
    if $cart_id != nil
      @i = Item.where(cart_id: $cart_id).destroy_all
    else 
      @c = cookies[:cart_id]
      @i = Item.where(cart_id: @cart_id).destroy_all
    end
    redirect_to home_path
  end

  
  def get_last_category 
  	p = Product.find (@item.product_id)	
  	return p.category_id
  end

  private
    def item_params
      params.require(:item).permit(:help_product_id, :cart_id, :size, :quantity, :product_id)
    end

end
