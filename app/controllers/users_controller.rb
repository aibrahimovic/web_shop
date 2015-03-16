class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user[:role_id] = 2
    @cart = Cart.new
  
    if @user.save
        @cart.user_id = @user.id
        @cart.save
    	  log_in @user
        SignUpNotifier.registrated(@user).deliver
        redirect_to home_path
    else
      flash.now[:same_user] = "Error"
      render 'new'
    end
  end

  def self.current=(u)
    @user = u
  end

  def self.current
    @user
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
    end

  
end
