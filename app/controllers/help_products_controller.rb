class HelpProductsController < ApplicationController
  def new
  	@all = HelpProducts.all 
  end

  def get_quantity(size)
  	@all.each do |x|
  		if x.size == size
  			return x.get_quantity
  		end
  	end
  end


end
