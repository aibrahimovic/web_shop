module SessionsHelper

	  def log_in(user) 
      session.delete(:counter);
      session[:user_id] = user.id
      #session[:counter] = @cart.counter
  	end

    def email_now
      @email_now = @current_user.email
    end

  	def logged_in?
    	!@current_user.nil?
  	end

  	def log_out
      @cart.counter = session[:counter]
      @cart.save
      session.delete(:counter)
      if session[:cart_id] != nil
        @cart = session[:cart_id]
        #session[:counter] = @cart.counter
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

    def create_new_order 
      @order = Order.new
      @order.user_id = nil
      @order.shipping_address_id = nil
      @order.billing_address_id = nil
      @order.save

      @order
    end

end