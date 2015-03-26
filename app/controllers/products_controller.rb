class ProductsController < ApplicationController

  def new
  	@product = Product.new
  end

  def show
    @counter =  session[:counter]
    @product = Product.find(params[:id])
    if !params[:counter].nil?
      #@counter += params[:counter].to_i
    end
  end

  def allProducts 
  	@products_all = Product.all
  end

  def get_quantity(size, p_id)
  	@all = HelpProduct.all
  	@all.each do |x|
  		if x.size == size && x.product_id == p_id
  			return x.quantity
  		else
        return 0
      end
  	end
  end

  def get_category_name(id_cat)
  	all_cat = Category.all
  	all_cat.each do |x|
  		if x.id = id_cat
  			return x.name.upcase + " / "
  		end
  	end
  end

  helper_method :get_category_name
  helper_method :get_quantity

end
