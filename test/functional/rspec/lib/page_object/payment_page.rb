class PaymentPage < PageContainer

	#verify
	def verify
			
	    	Watir::Wait.until { @browser.url.include? 'payments' }
			
			return @browser.url.include? 'payments'
		    
	end

	#element getters

	def card_number
		select_element(@browser.text_field(:id => 'card_number'))
	end

	def card_code
		select_element(@browser.text_field(:id => 'card_code'))
	end

	def card_year
		select_element(@browser.select_list(:id => 'card_year'))
	end

	def pay_button
		select_element(@browser.button(:id => 'plati')).wait_until_present
		return select_element(@browser.button(:id => 'plati'))
	end

	#actions 

	def enter_payment_information
		
		card_number.click
		card_number.set '4242424242424242'

		card_code.click
		card_code.set '123'

		#card_year.click
		card_year.select_value("2016")
		#card_year.select('2016')
		#card_year.click
		#(select '2016', from => 'card_year')

	end

	def get_confirmation_page
		pay_button.click
		return ConfirmationPage.new(@browser)
	end



end
