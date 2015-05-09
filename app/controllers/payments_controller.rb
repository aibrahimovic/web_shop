class PaymentsController < ApplicationController

	def show

		@path_to_address = find_address_path

		@shipping_address_id = params[:sh]
   	 	@billing_address_id = params[:bil]

   	 	if !@shipping_address_id.nil? && !@shipping_address_id.nil?
   	 		@shipping_address = Address.find_by(id: @shipping_address_id)
   	 		@billing_address = Address.find_by(id: @billing_address_id)
   	 	end

	end

end
