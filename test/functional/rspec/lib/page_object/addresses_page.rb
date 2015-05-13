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
		select_element(@browser.button(:value => 'CONTINUE')).wait_until_present
		return select_element(@browser.button(:value => 'CONTINUE'))
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


	def get_payment_page
		pay_button.click
		return PaymentPage.new(@browser)
	end

end