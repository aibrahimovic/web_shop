class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create
    @item = Item.new(item_params)

    @cart.add_item(@item)
    hp = HelpProduct.find_by(id: @item.help_product_id)
    redirect_to product_path(hp.product)
    
    flash.now[:quantity_number] = "Quantity must be number"
    

    
  end

  def destroy
    if @cart!= nil
      @i = Item.where(cart_id: @cart.id).destroy_all
    else 
      @c = session[:cart_id]
      @i = Item.where(cart_id: @cart.id).destroy_all
    end
    redirect_to home_path
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
