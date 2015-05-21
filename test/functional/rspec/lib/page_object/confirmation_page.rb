class ConfirmationPage < PageContainer

#verify 

	def verify
				
		Watir::Wait.until { @browser.url =='http://intense-hamlet-5821.herokuapp.com/' }
				
		return @browser.url == 'http://intense-hamlet-5821.herokuapp.com/'
			    
	end

	def verify_message

		select_element(@browser.div(:id => 'poruka')).wait_until_present
		return select_element(@browser.div(:id => 'poruka')).exist?
	end


	def verify_message_content
		Watir::Wait.until {@browser.h2.present?}
      	select_element(@browser.h2).wait_until_present
		return select_element(@browser.h2).exist?
	end

	#element getters

	def message_content
		sleep 5
		Watir::Wait.until {@browser.h2.present?}
		select_element(@browser.h2).wait_until_present
		return select_element(@browser.h2).text == 'Your order'
	end

	def signup_link
		select_element(@browser.a(:href => '/users/new')).wait_until_present
		return select_element(@browser.a(:href => '/users/new'))
	end

	def login_button
		select_element(@browser.a(:href => '/login')).wait_until_present
		return select_element(@browser.a(:href => '/login'))
	end

	#actions 

	def get_signup_page
		signup_link.click
		return SignupPage.new(@browser)
	end

	def get_login_page
		login_button.click
		return LoginPage.new(@browser)
	end

end


