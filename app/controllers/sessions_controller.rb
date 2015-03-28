class SessionsController < ApplicationController
  include RolesHelper

  def new
  end

  def create
    #//@cart.counter = session[:counter]
    #@cart.save

  	user = User.find_by(email: params[:session][:email].downcase)

    if user == nil
      flash.now[:notice] = "Email or password is incorrect."
      render 'new'
    elsif user.role.name == "Registrated" && user && user.authenticate(params[:session][:password])
    	log_in user
      redirect_to home_path
    elsif user.role.name == "Administrator" && user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to categories_path
    else
      flash.now[:notice] = "Email or password is incorrect."
		  render 'new'
    end
  end

  def destroy
  	log_out
  	redirect_to home_path
  end
  
end
