class StaticPagesController < ApplicationController
	  
  def new
    $all_categories = Category.all
  end

  def home
  	$all_categories = Category.all
  end

  def help
  end
end
