class ChargesController < ApplicationController

	def new
	end

	def create
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

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end



end
