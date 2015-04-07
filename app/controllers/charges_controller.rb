class ChargesController < ApplicationController

	def new
    	shipping_address = params["sh"]
    	billing_address = params["bil"]
	end

	def show

	end

	def choosen_addresses
		a1 = params[:address1]
		a2 = params[:address2]
	end


	def create
		choosen_addresses
		if !@current_user.nil?
			#after new address
			@shipping_address = Address.where(user_id: @current_user.id, tag: 'shipping').last
			@billing_address = Address.where(user_id: @current_user.id, tag: 'billing').last

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
	    :currency    => 'BAM'
	  )

	  redirect_to item_path(@cart, sh_address: @shipping_address, bil_address: @billing_address), :method => :delete


	  #redirect_to action: "destroy", id: 5
	  #redirect_to :controller => 'items', :action => 'destroy'
	  #redirect_to item_path(@cart, sh_address: @shipping_address, bil_address: @billing_address),
	  #redirect_to items_destroy_path(@cart, sh_address: @shipping_address, bil_address: @billing_address)


	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path

	
	end





end
