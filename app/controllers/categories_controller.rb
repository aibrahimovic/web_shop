 class CategoriesController < ApplicationController
  
  def new
  	@category = Category.new
    $all_categories = Category.all
  end


  def create
    @category = Category.new(category_params)
    en = params[:name2]
    category.attributes = { name: @category.name, locale: :ba }
    
    if @category.save
      $all_categories = Category.all
    	#render 'new'
      redirect_to categories_path
    else
      flash.now[:same_category] = "Already exists same category"
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def return_all 
    Category.all.each do |c|
      @arrayCategories.append(c.name)
      return @arrayCategories
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :name2)
    end

end
