class PaymentPage < PageContainer

	#verify
	def verify
			
	    	Watir::Wait.until { @browser.url.include? 'payments' }
			
			return @browser.url.include? 'payments'
		    
	end

	#element getters

	def email
		select_element(@browser.text_field(:id => 'email'))
	end

	def card_number
		select_element(@browser.text_field(:id => 'card_number'))
	end



	def cvc
		select_element(@browser.text_field(:id => 'cc-csc'))
	end

	def date
		select_element(@browser.text_field(:id => 'cc-exp'))
	end

	def pay_button
		select_element(@browser.span(:class => 'iconTick')).wait_until_present
		return select_element(@browser.span(:class=> 'iconTick'))
	end

	#actions 

	def enter_payment_information
		
		email.click
		email.set 'test.atlant@gmail.com'

		card_number.click
		card_number.set '4242424242424242'

		date.click
		date.set '10 / 15'

		cvc.click
		cvc.set '123'

		#card_year.click
		#card_year.select_value("2016")
		#card_year.select('2016')
		#card_year.click
		#(select '2016', from => 'card_year')

	end

	def get_confirmation_page
		pay_button.click
		return ConfirmationPage.new(@browser)
	end



end
