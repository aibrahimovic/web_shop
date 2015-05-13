class ImagesController < ApplicationController

  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def new
    @product_parameter = params[:product_id]
    @image = Image.new
    @product_images = Image.where(product_id: @product_parameter).all
    @main = Image.find_by(product_id: @product_parameter, main: '1')
  end

  def create
      @product_parameter = params[:image][:product_id]
      @image = Image.new(image_params)
      @images = Image.where(product_id: @product_parameter).all

      if @images.length == 0
        @image.main = '1'
        @image.save!
      end

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

  def destroy

    flag = false
    if !@image.main.nil?
      flag = true
    end

    @image.destroy
    if flag==true
      @other_images = Image.where(product_id: @image.product_id).all
      @new_main_image = @other_images.last
      @new_main_image.main = '1'
      @new_main_image.save!
    end
    respond_to do |format|
      format.html { redirect_to images_new_path(:product_id => @image.product_id), notice: 'Slika je uspješno izbirsana.' }
      format.json { head :no_content }
    end
  end

  def update_main_image
    @product_parameter = params[:product_param]
    @main_params = params[:main]

    @all_images = Image.where(product_id: @product_parameter).all
    @old_main = Image.find_by(product_id: @product_parameter, main: '1')
    @old_main.main = nil
    @old_main.save!
    @new_main = Image.find(@main_params)
    @new_main.main = '1'
    if @new_main.save!
      is_updated = true
    else
      is_updated = false
    end
    return render json: { error: is_updated }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:product_id, :avatar)
    end

end
