class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
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
      @cart.counter = 0
      @cart.save
      if @current_user.role.name == "Administrator"
        redirect_to allUsers_path
      else
      	log_in @user
        SignUpNotifier.registrated(@user).deliver
        redirect_to home_path
      end
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

  def allUsers 
    @users = User.all
  end

  def self.current=(u)
    @user = u
  end

  def self.current
    @user
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to allUsers_path, notice: 'Korisnik je uspješno izbrisan.' }
      format.json { head :no_content }
    end
  end

  def update

    respond_to do |format|
      
      if @user.update(user_params2)

        format.html { redirect_to allUsers_path, notice: 'Korisnik je uspješno izmjenjen.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @roles = Role.all
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
    end

    def user_params2
      params.require(:user).permit(:email, :role_id)
    end

    def set_user
      @user = User.find(params[:id])
    end

  def is_user_valid
    is_valid = @user.is_user_valid(params[:input_email])
    render json: { error: is_valid }
  end
  
end
