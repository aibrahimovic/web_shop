class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #PUBLISHABLE_KEY=pk_test_nW9vjMf1mArsmHVLZeoZus3I SECRET_KEY=sk_test_4l0brgkJ6N4gLKWA03eRiBsL rails s
  #amMts8OEtLR64z7W3nUICw #mandril

  include SessionsHelper

  protect_from_forgery with: :exception
  before_action :set_current_user, :set_cart, :find_address_path, :set_language


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
      @cart.counter = 0
      @cart.save()
  	end
    if session[:counter].nil?
      session[:counter] = @cart.counter
    end

  end

  def find_address_path
    if @current_user != nil
      a = Address.find_by(user_id: @current_user.id)
      if a != nil
        pa = address_path(@current_user.id)
      else
        pa = new_address_path
      end
    else
      pa = new_address_path
    end

    return pa
  end

  def get_counter
    counter = session[:counter]
    render json: { counter: counter } 
  end

  def set_order
    if @order.nil?
      @order = create_new_order
    end
  end

  def set_language
    @language = session[:language]
    if @language.nil?
      I18n.locale = :bs
    else
      if @language == "bs"
        I18n.locale = :bs
      else
        I18n.locale = :en
      end
    end
    #else
      #I18n.locale = :en
    #end
  end


  before_action :set_locale
 
  def set_locale
    if cookies[:educator_locale] && I18n.available_locales.include?(cookies[:educator_locale].to_sym)
      l = cookies[:educator_locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:educator_locale] = l
    end
    I18n.locale = l
  end


end
