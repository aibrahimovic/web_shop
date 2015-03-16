class AddressesController < ApplicationController
  include SessionsHelper

  def new
  	@address = Address.new
  end

  def create
  	@address = Address.new(address_params)
  	u = current_user
  	if u != nil
  		@address.user_id = u.id
  	end

    if @address.save
        redirect_to home_path
    else
      flash.now[:address_error] = "Popunite sva polja"
      render 'new'
    end
  end


  private

    def address_params
      params.require(:address).permit(:name, :address_name, :city, :region, :zip, :state, :phone, :user_id)
    end
end
