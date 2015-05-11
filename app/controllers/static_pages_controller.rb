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

    @special = Product.where(special: '1', sale: '').all
    @special_sale = []
    @all = Product.where(special: '1').all
    @all.each do |product|
      if product.sale != ''
        @special_sale << product
      end
    end

  end

  def admin
  	$all_categories = Category.all
  end

  def help
  end
end
