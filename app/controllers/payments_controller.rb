class PaymentsController < ApplicationController

	def show

		@path_to_address = find_address_path

		@shipping_address_id = params[:sh]
   	 	@billing_address_id = params[:bil]

   	 	@shipping_address = Address.find(@shipping_address_id)
   	 	@billing_address = Address.find(@billing_address_id)
	end

end
