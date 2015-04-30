 class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
  	@category = Category.new
    @categories = Category.all
    $all_categories = Category.all
  end


  def create
    @category = Category.new(category_params)
    engleski = params[:name2]
    bosanski = params[:name]
    
    #previous_locale = I18n.locale
    #I18n.locale = :en
    #@category.name = engleski
    #I18n.locale = previous_locale


    @category..attributes = { name: bosanski, locale: :bs }
    @category.attributes = { name: engleski, locale: :en }
    @category.save!

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
    @all_products_in_category = Product.where(category_id: @category.id).all
  end

  def return_all 
    Category.all.each do |c|
      @arrayCategories.append(c.name)
      return @arrayCategories
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Kategorija je uspješno izbirsana.' }
      format.json { head :no_content }
    end
  end


  def update
    respond_to do |format|
      if @category.update(product_params)
        format.html { redirect_to categories_path, notice: 'Kategorija je uspješno izmjenjena.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :name2)
    end

end
