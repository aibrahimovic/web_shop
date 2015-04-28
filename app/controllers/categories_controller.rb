 class CategoriesController < ApplicationController
  
  def new
  	@category = Category.new
    $all_categories = Category.all
  end


  def create
    @category = Category.new(category_params)
    en = params[:name2]
    
    I18n.locale = :en
    post.title # => 'Globalize rocks!'
    post.name  # => 'Globalize'

    I18n.locale = :nl
    post.title # => 'Globalize rocks!'
    post.name  # => 'Globalize'
    
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
