class StaticPagesController < ApplicationController
	  
  def new
    $all_categories = Category.all
  end

  def home
  	$all_categories = Category.all
    @all_products = Product.all
    @all_products_on_sale = []
    @all_products.each do |product|
      if product.get_price != product.price
        @all_products_on_sale << product
      end
    end
  end

  def admin
  	$all_categories = Category.all
  end

  def help
  end
end
