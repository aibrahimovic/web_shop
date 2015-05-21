class AddressesPage < PageContainer
    
    #def fill_fields
		#$text_field(:s_name, :id => 'shipping_address_name')
		#$text_field(:s_address, :id => 'shipping_address_street')
		#$text_field(:s_city, :id => 'shipping_address_city')
		#$text_field(:s_country, :id => 'shipping_address_country')
		#$text_field(:s_zip, :id => 'shipping_address_zip')
		#$text_field(:s_phone, :id => 'shipping_address_phone')
		#$checkbox(:s_clone, :id => 'clone_shipping_info')
	#end


	def verify
		
    	Watir::Wait.until { @browser.url.include? 'addresses/new' }
    	return @browser.url.include? 'addresses/new'
    end


    #element getters
	def s_name
		select_element(@browser.text_field(:id => 'new_address_name_s'))
	end 

	def s_address
		select_element(@browser.text_field(:id => 'new_address_street_s'))
	end 

	def s_city
		select_element(@browser.text_field(:id => 'new_address_city_s'))
	end 

	def s_region
		select_element(@browser.text_field(:id => 'new_address_region_s'))
	end 

	def s_zip
		select_element(@browser.text_field(:id => 'new_address_zip_s'))
	end 

	def s_state
		select_element(@browser.text_field(:id => 'new_address_state_s'))
	end 

	def s_phone
		select_element(@browser.text_field(:id => 'new_address_phone_s'))
	end 
	#def s_clone
		#select_element(@browser.checkbox(:id => 'billing_checkbox'))
	#end 

	def pay_button
		select_element(@browser.button(:id => 'payment_button')).wait_until_present
		return select_element(@browser.button(:id => 'payment_button'))
	end

	def proceed_button
		select_element(@browser.button(:class => 'btn btn-primary button_nastavi')).wait_until_present
		return select_element(@browser.button(:class => 'btn btn-primary button_nastavi'))
	end

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

	def pay_button_stripe
		select_element(@browser.span(:class => 'iconTick')).wait_until_present
		return select_element(@browser.span(:class=> 'iconTick'))
	end

	

	#actions
	def enter_address_information
		s_name.click
		s_name.set 'John Doe'

		s_address.click
		s_address.set 'Address'

		s_city.click
		s_city.set 'City'

		s_region.click
		s_region.set 'Region'

		s_zip.click
		s_zip.set '00000'



		s_state.click
		s_state.set 'State'
		
		
		
		s_phone.click
		s_phone.set '000000000'
		
		#s_clone.set 'active'
	
	end

	def check_header
		select_element(@browser.h2(:id => 'payment_h2')).wait_until_present
		return select_element(@browser.h2(:id => 'payment_h2')).text == 'Delivery address'
	end

	def check_header_b
		select_element(@browser.h2(:id => 'payment_h2_b')).wait_until_present
		return select_element(@browser.h2(:id => 'payment_h2_b')).text == 'Billing address'
	end

	def check_name
		sleep 5
		select_element(@browser.span(:id => 'payment_name')).wait_until_present
		return select_element(@browser.span(:id => 'payment_name')).text == 'John Doe'
	end

	def check_address
		select_element(@browser.span(:id => 'payment_adress')).wait_until_present
		return select_element(@browser.span(:id => 'payment_adress')).text == 'Address'
	end

	def check_city
		select_element(@browser.span(:id => 'payment_city')).wait_until_present
		return select_element(@browser.span(:id => 'payment_city')).text == 'City'
	end

	def check_region
		select_element(@browser.span(:id => 'payment_region')).wait_until_present
		return select_element(@browser.span(:id => 'payment_region')).text == 'Region'
	end

	def check_zip
		select_element(@browser.span(:id => 'payment_zip')).wait_until_present
		return select_element(@browser.span(:id => 'payment_zip')).text == '00000'
	end

	def check_state
		select_element(@browser.span(:id => 'payment_state')).wait_until_present
		return select_element(@browser.span(:id => 'payment_state')).text == 'State'
	end

	def check_phone
		select_element(@browser.span(:id => 'payment_phone')).wait_until_present
		return select_element(@browser.span(:id => 'payment_phone')).text == '000000000'
	end


	def check_name_b
		select_element(@browser.span(:id => 'payment_name_b')).wait_until_present
		return select_element(@browser.span(:id => 'payment_name_b')).text == 'John Doe'
	end

	def check_address_b
		select_element(@browser.span(:id => 'payment_adress_b')).wait_until_present
		return select_element(@browser.span(:id => 'payment_adress_b')).text == 'Address'
	end

	def check_city_b
		select_element(@browser.span(:id => 'payment_city_b')).wait_until_present
		return select_element(@browser.span(:id => 'payment_city_b')).text == 'City'
	end

	def check_region_b
		select_element(@browser.span(:id => 'payment_region_b')).wait_until_present
		return select_element(@browser.span(:id => 'payment_region_b')).text == 'Region'
	end

	def check_zip_b
		select_element(@browser.span(:id => 'payment_zip_b')).wait_until_present
		return select_element(@browser.span(:id => 'payment_zip_b')).text == '00000'
	end

	def check_state_b
		select_element(@browser.span(:id => 'payment_state_b')).wait_until_present
		return select_element(@browser.span(:id => 'payment_state_b')).text == 'State'
	end

	def check_phone_b
		select_element(@browser.span(:id => 'payment_phone_b')).wait_until_present
		return select_element(@browser.span(:id => 'payment_phone_b')).text == '000000000'
	end

	

	def check_address_page_name
		$name=select_element(@browser.span(:id => 'payment_name')).wait_until_present
		return $name=='John Doe'
	end

	def check_address_page_address
		$address=select_element(@browser.span(:id => 'payment_address')).wait_until_present
		return $address=='Address'
	end

	def check_address_page_city
		$city=select_element(@browser.span(:id => 'payment_city')).wait_until_present
		return $city=='City'
	end

	def check_address_page_region
		$region=select_element(@browser.span(:id => 'payment_region')).wait_until_present
		return $region=='Region'
	end

	def check_address_page_zip
		$zip=select_element(@browser.span(:id => 'payment_zip')).wait_until_present
		return $zip=='00000'
	end

	def check_address_page_state
		$state=select_element(@browser.span(:id => 'payment_state')).wait_until_present
		return $state=='State'
	end

	def check_address_page_phone
		$phone=select_element(@browser.span(:id => 'payment_phone')).wait_until_present
		return $phone=='000000000'
	end

	def get_address_page2
		proceed_button.click
	end

	def get_payment_popup
		pay_button.click
			#@browser.switch_to.window.(:title => 'Web shop').use do
			#@popup = Watir::Browser.attach(:title,'Web shop')
			#select_element(@popup.text_field(:id => 'email')).wait_until_present
  			#select_element(@popup.text_field(:id => 'email')).click
  			#select_element(@popup.text_field(:id => 'email')).set 'test.atlant@gmail.com'

			#@browser.windows.last.use do
  			#select_element(@browser.text_field(:id => 'email')).wait_until_present
  			#select_element(@browser.text_field(:id => 'email')).click
  			#select_element(@browser.text_field(:id => 'email')).set 'test.atlant@gmail.com'
  			#pay_button_stripe.click
		#end

			#@browser.window.(title: 'Web shop') do
		@browser.windows.last.use do
			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'email')).click
			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'email')).set 'test.atlant@gmail.com'

			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'card_number')).click
			$element=select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'card_number'))
			$element.set '4242 4242 4242 4242'
			$element.send_keys '4242 4242 4242 4242'
			$element.send_keys '4242 4242 4242 4242'
			$element.send_keys '4242 4242 4242 4242'


			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'cc-exp')).click
			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'cc-exp')).send_keys '10'
			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'cc-exp')).send_keys '15'

			#select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'cc-exp')).click
			#select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'cc-exp')).set '15'

			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'cc-csc')).click
			select_element(@browser.iframe(name: 'stripe_checkout_app').text_field(:id => 'cc-csc')).set '456'

			select_element(@browser.iframe(name: 'stripe_checkout_app').span(:class => 'iconTick')).click
			
			#@browser.windows.last.use do
			sleep 5
			#@browser.refresh
			return ConfirmationPage.new(@browser)
			#end

		end

	end


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