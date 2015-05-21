class LoginPage < PageContainer


	#verify

	def verify
				
		Watir::Wait.until { @browser.url =='https://webshop-abhshoes.herokuapp.com/login' }
				
		return @browser.url == 'https://webshop-abhshoes.herokuapp.com/login'
			    
	end

	def verify_login_button
		#Watir::Wait.until { @browser.button(:class => 'btn btn-default').exist? }
		select_element(@browser.input(:class => 'btn btn-primary')).wait_until_present
		return select_element(@browser.input(:class => 'btn btn-primary')).exist?
	end


	#element getters

	def email
		select_element(@browser.text_field(:id => 'session_email')).wait_until_present
		return select_element(@browser.text_field(:id => 'session_email'))
	end

	def password
		select_element(@browser.text_field(:id => 'session_password')).wait_until_present
		return select_element(@browser.text_field(:id => 'session_password'))
	end

	def login_button
		select_element(@browser.button(:class => 'btn btn-primary')).wait_until_present
		return select_element(@browser.button(:class => 'btn btn-primary'))
	end

	def naslov
		select_element(@browser.h2).wait_until_present
		return select_element(@browser.h2)
	end

	def user_email
		select_element(@browser.text_field(:id => 'emailId'))
	end

	def user_password
		select_element(@browser.text_field(:id => 'new_user_password'))
	end

	def signup_link
		select_element(@browser.a(:href => '/users/new')).wait_until_present
		return select_element(@browser.a(:href => '/users/new'))
	end


	#actions

	def enter_login_information(uemail,upass)
		#//puts uemail
		#puts upass + "2"
		email.click
		email.set uemail

		password.click
		#select_element(@browser.button(:class => 'btn btn-default')).present?
		password.set upass
	end

	def enter_login_admin_information(email,pass)
        
        @browser.refresh

        user_email.click
        user_email.set email
      

        user_password.click
        user_password.set pass

    end

	def click_login_button
		login_button.click
		return LandingPage.new(@browser)
	end

	def check_title
		return naslov.text == "Prijava"
	end

	def check_pass_label
		select_element(@browser.label(:for => 'session_Šifra')).wait_until_present
		return select_element(@browser.label(:for => 'session_Šifra')).text == "Šifra"
	end

	def check_email_label
		select_element(@browser.label(:for => 'session_Email')).wait_until_present
		return select_element(@browser.label(:for => 'session_Email')).text == "Email"
	end

	def get_admin_page
		login_button.click
		return AdminPage.new(@browser)
	end

	def get_signup_page
		signup_link.click
		return SignupPage.new(@browser)
	end

end
