class ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def create

    @item = Item.new(item_params)
    tag = false

    @id_p = @item.help_product_id
    hp = HelpProduct.where(product_id: @item.help_product_id).all
    hp.each do |x| 
      if x.size == @item.size
        @item.help_product_id = x.id
      end
    end


    #@item.help_product_id = HelpProduct.where(size: @item.size)
    #@item.help_product_id = 4

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
          redirect_to product_path(@id_p)
          #dodati broj na korpu u desnom čošku
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
      params.require(:item).permit(:help_product_id, :cart_id, :size, :quantity)


    end

end
