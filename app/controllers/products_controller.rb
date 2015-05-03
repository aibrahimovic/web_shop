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
    bosnian = @product.name
    english = params[:name2]
    desc_bosnian = @product.description
    desc_english = params[:description2]

    percent = params[:sale_percent]
    if percent != ""
      old_price = @product.price.to_f
      new_price = old_price - (percent.to_f/100)*old_price
      @product.sale = new_price.to_s
    end
    
    @product.attributes = { name: bosnian, description: desc_bosnian, locale: :bs }
    @product.attributes = { name: english, description: desc_english, locale: :en }
    #@product.save!

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

  def update_item_price(new_price, product)

    help_product = HelpProduct.find_by(product_id: product)
    cart_items = self.items
    cart_items.each do |item| 
      if item.help_product_id == help_product.id
        if new_price != ""
          item.price = new_price
        else
          p = Product.find(product)
          item.price = p.price
        end
        item.save
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        percent = params[:sale_percent]
          if percent != ""
            old_price = @product.price.to_f
            new_price = old_price - (percent.to_f/100)*old_price

            help_product = HelpProduct.find_by(product_id: @product.id)
            cart_items = Item.all
            cart_items.each do |item| 
              if item.help_product_id == help_product.id
                if new_price != ""
                  item.price = new_price
                else
                  item.price = @product.price
                end
                item.save
              end
            end

            #@cart.update_item_price(new_price, @product.id)
            @product.sale = new_price.to_s
            @product.save!
          else
            new_price = params[:product][:sale]

            help_product = HelpProduct.find_by(product_id: @product.id)
            cart_items = Item.all
            cart_items.each do |item| 
              if item.help_product_id == help_product.id
                if new_price != ""
                  item.price = new_price
                else
                  item.price = @product.price
                end
                item.save
              end
            end

            #@cart.update_item_price(new_price, @product.id)
          end
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
      params.require(:product).permit(:name, :image, :price, :description, :category_id, :name2, :description2, :sale, :sale_percent)
    end

  helper_method :get_category_name
  helper_method :get_quantity

end
