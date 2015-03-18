module SessionsHelper

	  def log_in(user) 
      session[:user_id] = user.id
  	end

    def email_now
      @email_now = @current_user.email
    end

  	def logged_in?
    	!@current_user.nil?
  	end

  	def log_out
      if session[:cart_id] != nil
        @cart = session[:cart_id]
      end
    	session.delete(:user_id)
    	#@current_user = nil
  	end

    def create_new_cart
      @cart = Cart.new
      @cart.user_id = nil
      @cart.save
      session[:cart_id] = @cart.id

      @cart
    end

end