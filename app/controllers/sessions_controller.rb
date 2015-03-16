class SessionsController < ApplicationController
  include RolesHelper

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

    if user.role_id == 2 && user && user.authenticate(params[:session][:password])
    	log_in user
      redirect_to home_path
    elsif user.role_id == 1 && user && user.authenticate(params[:session][:password])
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
