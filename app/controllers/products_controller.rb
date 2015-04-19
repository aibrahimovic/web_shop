class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy] 

  def new
  	@product = Product.new
    @categories = Category.all
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
        format.html { redirect_to help_products_new_path(:product_id => @product.id), notice: 'Proizvod je uspješno kreiran.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to allProducts_path, notice: 'Proizvod je uspješno izmjenjen.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def allProducts 
  	@products = Product.all
  end

  def destroy
    id = @product.id
    items = Item.all
    if @product.destroy
      help_products = HelpProduct.where(product_id: id).all
      help_products.each do |hp|
        items.each do |item|
          if item.help_product == hp
            item.destroy
          end
        end
        hp.destroy
      end

    end
    respond_to do |format|
      format.html { redirect_to allProducts_path, notice: 'Proizvod je uspješno izbirsan.' }
      format.json { head :no_content }
    end
  end

  def edit
    @categories = Category.all
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
