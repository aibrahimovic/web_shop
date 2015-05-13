class SignupPage < PageContainer
  
 

	#verify


	def verify
				
		Watir::Wait.until { @browser.url =='https://webshop-abhshoes.herokuapp.com/users/new' }
				
		return @browser.url == 'https://webshop-abhshoes.herokuapp.com/users/new'
			    
	end

	def verify_welcome_message
		select_element(@browser.input(:class => 'notice col-md-12')).wait_until_present
		return select_element(@browser.input(:class => 'notice col-md-12')).exist?
	end

	def verify_message_content
     	select_element(@browser.div(:text => 'Welcome')).wait_until_present
		return select_element(@browser.div(:text => 'Welcome')).exist?
	end



	#element getters
	def user_full_name
		select_element(@browser.text_field(:id => 'user_full_name'))
	end

	def user_email
		select_element(@browser.text_field(:id => 'emailId'))
	end

	def user_password
		select_element(@browser.text_field(:id => 'new_user_password'))
	end

	def user_password_confirmation
		select_element(@browser.text_field(:id => 'new_user_password_confirmation'))
	end

	def register_button
		select_element(@browser.button(:id => 'new_user_button')).wait_until_present
		return select_element(@browser.button(:id => 'new_user_button'))
	end
	def cart_button
		
		select_element(@browser.a(:class => 'nav_link', :href => '/carts')).wait_until_present
		return select_element(@browser.a(:class => 'nav_link', :href => '/carts'))
	end

	def get_email
		return user_email.value
	end
	def get_pass
		return user_password.value
	end

	#actions

	def enter_signup_information(email,pass)
        #user_full_name.click
        #user_full_name.set "test"
        puts email
        puts pass

        user_email.click
        user_email.set email
        #$email=user_email.value
        #puts @email

        user_password.click
        user_password.set pass
        #$pass=user_password.value

        #include_context "EmailPass", email, pass


        user_password_confirmation.click
        user_password_confirmation.set pass
    end

    def click_registration_button
    	register_button.click
    end

    def get_cart_page
		cart_button.click
		return CartPage.new(@browser)
	end

    def delete_user_from_db

    	User.last.destroy
    end

end
