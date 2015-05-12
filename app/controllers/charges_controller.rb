class ChargesController < ApplicationController
	before_action :set_addresses, only: [:show, :new, :create] 

	def new
	end

	def show
	end

	def create

		
	HelpProduct.transaction do
		@cart.items.each do |item|
			item.help_product.lock!
		end
		
		#(0..10000000000).each{ |s| puts(s) }


		if !@current_user.nil? && !@shipping.nil? && !@billing.nil?
			@shipping_address = @shipping
			@billing_address = @billing
		else
			#@shipping_address = Address.where(user_id: @current_user.id, tag: 'shipping').last
			#@billing_address = Address.where(user_id: @current_user.id, tag: 'billing').last
			if !@current_user.nil?
	       		@shipping_address = Address.where(user_id: @current_user.id, tag: 'shipping').last
	      		@billing_address = Address.where(user_id: @current_user.id, tag: 'billing').last
	        else
	            @shipping_address = Address.where(user_id: '0', tag: 'shipping').last
	            @billing_address = Address.where(user_id: '0', tag: 'billing').last
	        end
		end	


	  # Amount in cents
	  
	  @amount = @cart.get_total_with_delivery.to_i*100

	  customer = Stripe::Customer.create(
	    :email => 'test.atlant@gmail.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'bam'
	  )

	  @cart.items.each do |item|
			hp = HelpProduct.find_by(id: item.help_product_id)
	        hp.quantity = hp.quantity - item.quantity
	        hp.save
		end


	end

	  redirect_to itemsDestroy_path(@cart, sh_address: @shipping_address, bil_address: @billing_address)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path	
	end

	private
	    def set_addresses
		    @shipping = params["sh"]
	    	@billing = params["bil"]
	    end
end
