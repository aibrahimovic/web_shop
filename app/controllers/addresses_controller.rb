class AddressesController < ApplicationController
  include SessionsHelper

  def new
  	@address1 = Address.new
    @address2 = Address.new

    @array_of_states = []
    @array_of_states << "Bosna i Hercegovina"
    @array_of_states << "Hrvatska"
    @array_of_states << "Slovenija"
    @array_of_states << "Austrija"
  end

  def create
  	#@address1 = Address.new(address_params)
    #@address2 = Address.new(address2_params)

    #if @current_user != nil
  		#@address1.user_id = @current_user.id
  	#end

    #@address1.tag = 's'
    #@address2.tag = 'b'
    #if @address1.save && @address2.save
      #flag = true
      #return true
    #elsif @address1.save
      #return true
    #else
      #flash.now[:address_error] = "Popunite sva polja"
      #render 'new'
    #end

    #redirect_to charges_path


    #if flag == true
      #a_pom = Address.new
      #a_pom.name = @address1.name
      #a_pom.address_name = @address1.address_name
      #a_pom.city = @address1.city
      #a_pom.region = @address1.region
      #a_pom.zip = @address1.zip
      #a_pom.state = @address1.state
      #a_pom.user_id = @address1.user_id
      #a_pom.phone = @address1.phone
      #a_pom.tag = 'b'
      #a_pom.save()
      #redirect_to new_charge_path
      
    #end
  end

  def add_address 
    @adr = Address.new
    is_added = @adr.create_address(params[:name], params[:address_name], params[:city], params[:region], params[:zip], params[:state], params[:phone], params[:user_id], params[:tag])
    #return render json: { error: is_added } 
    
    redirect_to new_charge_path
  end


  private

    def address_params
      params.require(:address).permit(:name, :address_name, :city, :region, :zip, :state, :phone, :user_id, :tag)
    end

    def address2_params
      params.require(:address).permit(:name, :address_name, :city, :region, :zip, :state, :phone, :user_id, :tag)
    end

  def single_item_price
    number, price, delivery, total = @cart.temporary_cart_count_prices
    render json: { number: number, price: price, delivery: delivery, total: total } 
  end
  
end

