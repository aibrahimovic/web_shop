module SessionsHelper

	  def log_in(user) 

      cart = Cart.find_by(user_id: user.id)
      if cart == nil
        cart = Cart.new
        cart.user_id = user.id
        $cart_id = cart.id
        cart.save
      else
        $cart_id = cart.id
      end
    	session[:user_id] = user.id
  	end

  	def current_user
    	@current_user ||= User.find_by(id: session[:user_id])
  	end

    def email_now
      @email_now = @current_user.email
    end

  	def logged_in?
    	!current_user.nil?
  	end

  	def log_out
    	session.delete(:user_id)
    	@current_user = nil
  	end

end