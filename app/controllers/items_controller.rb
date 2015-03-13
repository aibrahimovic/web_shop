class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create

    @item = Item.new(item_params)
    #@all_items = Item.all
    #tag = false
    
    #@all_items.each do |x|
      #if x.product_id == @item.product_id
        #provjeri da li je ista veličina, ako jeste povečati količinu i tag na true, ako nije tag = false
      #end
    #end


    #product is not in table items
    if tag == false
      if @item.save
          redirect_to categories_path("1") #get_last_category)
      else
        #flash.now[:same_user] = "Error"
        render 'new'
      end
    end
  end

  def get_last_category 
  	p = Product.find (@item.product_id)	
  	return p.category_id
  end

  private

    def item_params
      params.require(:item).permit(:product_id, :cart_id)
    end

end
