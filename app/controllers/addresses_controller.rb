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

    @item = Item.find_by(tag: 0)

  end

  def create
    redirect_to home_path
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

  def show
    @address1 = params[:address1]
    @address2 = params[:address2]
  end

  def set_clicked_addresses
    return params[:address1], params[:address2]
    raise
  end

  def get_user_for_address
    if @current_user.nil?
      user = 0
    else
      user = @current_user.id
    end
  end

  def get_first_address_shipping
    if !@current_user.nil?
      first = Address.where(user_id: @current_user.id, tag: 'shipping').first
    end

    first
  end

  def get_first_address_billing
    if !@current_user.nil?
      first = Address.where(user_id: @current_user.id, tag: 'billing').first
    end

    first
  end

  def get_all_user_shipping_addresses
    if !@current_user.nil?
      all_addresses = Address.where(user_id: @current_user.id, tag: 'shipping').all
    end
    all_addresses
  end

  def get_all_user_billing_addresses
    if !@current_user.nil?
      all_addresses = Address.where(user_id: @current_user.id, tag: 'billing').all
    end
    all_addresses
  end

  def add_address 
    @adr = Address.new
    is_added = @adr.create_address(params[:name], params[:address_name], params[:city], params[:region], params[:zip], params[:state], params[:phone], params[:user_id], params[:tag])
    if is_added==false
      return render json: { error: is_added }
    else
      redirect_to home_path
    end

    redirect_to home_path
  end

  def send_to_payment
    redirect_to home_path
  end

  helper_method :get_user_for_address, :get_first_address_shipping, :get_first_address_billing, :get_all_user_shipping_addresses, :get_all_user_billing_addresses


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

