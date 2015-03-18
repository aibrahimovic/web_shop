class AddressesController < ApplicationController
  include SessionsHelper

  def new
  	@address1 = Address.new
  end

  def create
  	@address1 = Address.new(address_params)

    if @current_user != nil
  		@address1.user_id = @current_user.id
  	end

    @address1.tag = 's'
    if @address1.save
      flag = true
    else
      flash.now[:address_error] = "Popunite sva polja"
      render 'new'
    end

    if flag == true
      a_pom = Address.new
      a_pom.name = @address1.name
      a_pom.address_name = @address1.address_name
      a_pom.city = @address1.city
      a_pom.region = @address1.region
      a_pom.zip = @address1.zip
      a_pom.state = @address1.state
      a_pom.user_id = @address1.user_id
      a_pom.phone = @address1.phone
      a_pom.tag = 'b'
      a_pom.save()
      redirect_to new_charge_path
    end
  end


  private

    def address_params
      params.require(:address).permit(:name, :address_name, :city, :region, :zip, :state, :phone, :user_id, :tag)
    end
end
