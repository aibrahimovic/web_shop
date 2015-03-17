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
      #SignUpNotifier.registrated(@user).deliver
      redirect_to home_path
    else
      u = User.find_by(email: @user.email)
      pa1 = @user.password
      pa2 = @user.password_confirmation

      if u != nil
        flash.now[:same_user] = "User already exists"
      elsif pa1 != nil && pa2 != nil && pa1 != pa2
        flash.now[:same_user] = "Repeat password"
      elsif pa1 != nil && pa1.length < 5
        flash.now[:same_user] = "Password should be minimum 5 characters"  
      else 
        flash.now[:same_user] = "Insert data"          
      end
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
