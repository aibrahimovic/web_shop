class ImagesController < ApplicationController

  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def new
    @product_parameter = params[:product_id]
    @image = Image.new
  end

  def create
      @image = Image.new(image_params)

      respond_to do |format|
        if @image.save
          format.html { redirect_to images_new_path(:product_id => @image.product_id), notice: 'Slike proizvoda su uspješno kreirane.' }
          format.json { render :show, status: :created, location: @image }
        else
          format.html { render :new }
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
  end

  #def destroy
    #@image.destroy
    #respond_to do |format|
      #format.html { redirect_to images_new_path(:product_id => @help_product.product_id), notice: 'Slike je uspješno izbirsan.' }
      #format.json { head :no_content }
    #end
  #end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_product
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:product_id, :avatar)
    end

end
