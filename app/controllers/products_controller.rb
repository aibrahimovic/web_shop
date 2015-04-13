class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to allProducts_path, notice: 'Proizvod je uspješno kreiran.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def allProducts 
  	@products = Product.all
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to allProducts_path, notice: 'Proizvod je uspješno izbirsan.' }
      format.json { head :no_content }
    end
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

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :image, :price, :description, :category_id)
    end

  helper_method :get_category_name
  helper_method :get_quantity

end
