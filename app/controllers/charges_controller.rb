class ChargesController < ApplicationController

	def new
	end

	def create
	  # Amount in cents
	  if $single != nil
	  	@amount = $single*100
	  else
	  	@amount = ($total)*100
	  end

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

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end



end
