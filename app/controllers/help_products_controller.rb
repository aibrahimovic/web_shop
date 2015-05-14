class HelpProductsController < ApplicationController
  before_action :set_help_product, only: [:show, :edit, :update, :destroy]
  before_action :product_exists, only: [:create]

  def new
    @product_parameter = params[:product_param]
    if @product_parameter.nil?
      @product_parameter = params[:product_id]
    end
    @help_product = HelpProduct.new
    @help_products = HelpProduct.where(product_id: @product_parameter).all
    
  end

  def create
    if @help_product_exists.nil?
      @help_product = HelpProduct.new(help_product_params)

      respond_to do |format|
        if @help_product.save
          format.html { redirect_to help_products_new_path(:product_param => @help_product.product_id), notice: 'Varijacije proizvoda su uspješno kreirane.' }
          format.json { render :show, status: :created, location: @help_product }
        else
          format.html { render :new }
          format.json { render json: @help_product.errors, status: :unprocessable_entity }
        end
      end
    else
      @help_product = HelpProduct.find_by(id: @help_product_exists)
      quantity_to_update = params[:help_product][:quantity]
      @help_product.quantity += quantity_to_update.to_i
      if @help_product.save
        redirect_to help_products_new_path(:product_param => @help_product.product_id)
      end
    end 
  end

  def destroy
    @help_product.destroy
    respond_to do |format|
      format.html { redirect_to help_products_new_path(:product_param => @help_product.product_id), notice: 'Proizvod je uspješno izbirsan.' }
      format.json { head :no_content }
    end
  end


  def get_quantity(size)
  	@all.each do |x|
  		if x.size == size
  			return x.get_quantity
  		end
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_product
      @help_product = HelpProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_product_params
      params.require(:help_product).permit(:size, :quantity, :product_id)
    end

    def product_exists
      @help_product = HelpProduct.find_by(size: params[:help_product][:size], product_id: params[:help_product][:product_id])
      if @help_product.nil?
        @help_product_exists = nil
      else 
        @help_product_exists =  @help_product.id
      end
    end


end
