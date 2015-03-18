class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper

  protect_from_forgery with: :exception
  before_action :set_current_user, :set_cart
  before_action 

  def set_current_user
  	@current_user = User.find_by(id: session[:user_id])
  end

  def set_cart
  	if @current_user
  		@cart = Cart.find_by(user_id: @current_user.id)
  	else 
  		@cart = Cart.find_by(id: session[:cart_id])
  	end

  	if @cart.nil?
  		@cart = create_new_cart
  	end
  end



end
