class CartPage < PageContainer

	#verify
	def verify
		
    	Watir::Wait.until { @browser.url.include? 'carts' }
    	return @browser.url.include? 'carts'
    end

    def verify_cart_quantity(quantity)
    	#sleep 15
    	#@browser.refresh
    	sleep 5
    	#puts quantity
    	quantity = quantity.to_s

    	Watir::Wait.until { @browser.li(:id =>'counter').present? }
    	#element=select_element(@browser.li(:id =>'counter')).wait_until_present
    	#@browser.refresh
		#select_element(@browser.li(:id =>'counter')).exist?
		#a = 99
		#puts a
		#a = select_element(@browser.li(:id => 'counter')).text
		#puts a
		#puts select_element(@browser.li(:id => 'counter')).text.to_s
		return select_element(@browser.li(:id => 'counter')).text == quantity
    end

    def verify_signup_link
		#Watir::Wait.until { @browser.button(:class => 'btn btn-default').exist? }
		select_element(@browser.a(:href => '/users/new')).wait_until_present
		return select_element(@browser.a(:href => '/users/new')).exist?
	end

	def verify_product_image
		select_element(@browser.img(:alt=>'M1')).wait_until_present
		return select_element(@browser.img(:alt=>'M1')).exist?
	end

	def verify_product_price(price)
		select_element(@browser.span(:class=>'cart_price')).wait_until_present
		return select_element(@browser.span(:class=>'cart_price')).text == price
	end
		
	def verify_login_information
		select_element(@browser.a(:href=> '/login')).wait_until_present
		return select_element(@browser.a(:href=> '/login')).exist?
	end

	




    #element getters
	def proceed_button
		select_element(@browser.button(:id => 'cart_nastavi')).wait_until_present
		return select_element(@browser.button(:id => 'cart_nastavi'))
    end

    def ok_button
    	select_element(@browser.a(:id => '57')).wait_until_present
		return select_element(@browser.a(:id => '57'))
    end

    def logout_button
    	select_element(@browser.a(:href => '/logout')).wait_until_present
    	return select_element(@browser.a(:href => '/logout'))
    end

    def product_name
		select_element(@browser.td.b(:text => 'Elegant shoes')).wait_until_present
		return select_element(@browser.td.b(:text => 'Elegant shoes')).text
	end

	def product_image
		select_element(@browser.img(:alt=>'M1')).wait_until_present
		return select_element(@browser.img(:alt=>'M1'))
	end

	def signup_link
		select_element(@browser.a(:href => '/users/new')).wait_until_present
		return select_element(@browser.a(:href => '/users/new'))
	end

	def quantity_field
		select_element(@browser.text_field(:id=>'675')).wait_until_present
		return select_element(@browser.text_field(:id=>'675'))
	end

	def quantity_field_pp
		select_element(@browser.text_field(:id=>'product_quantity_field_id')).wait_until_present
		return select_element(@browser.text_field(:id=>'product_quantity_field_id'))
	end

	def product_price
		
		select_element(@browser.text_field(:id=>'125+_item_price')).wait_until_present
		return select_element(@browser.text_field(:id=>'125+_item_price'))

	end



    #actions
	
	def get_addresses_page
		proceed_button.click
		return AddressesPage.new(@browser)
	end

	def log_out
		logout_button.click
		return LandingPage.new(@browser)
	end


	def click_ok_button
		ok_button.click
	end

	def get_signup_page
		signup_link.click
		return SignupPage.new(@browser)
	end

	def set_quantity(quantity)
		quantity_field.click
		##quantity_field.set quantity	
		#@browser.javascript_dialog.button('OK').click

		##@browser.alert.wait_until_present
		##a=@browser.switch_to.alert
		##a.ok
		quantity_field.set quantity
		@browser.alert.ok
		#@browser.alert.when_present.dismiss
		#a=@browser.switch_to.alert
		
		#a.ok
		@browser.refresh

		sleep 15
		#@browser.alert.ok
		#@browser.send_keys :enter
		
		#@browser.switch_to.alert
		#@browser.alert.ok
		#@browser.switch_to.alert
		#novi_alert.close
		#quantity_field.set quantity
		#@browser.alert.ok
		
		#@browser.alert.ok
		#@browser.javascript_dialog.button('OK').click
		#quantity_field.switch_to.window
		#@browser.wait
		#@browser.switch_to.alert.accept
		#a=@browser.switch_to.alert.accept
		#a.ok
		#a.close
	end

	def check_product_price(_id, price)
		select_element(@browser.text_field(:id=>_id)).wait_until_present
		return select_element(@browser.text_field(:id=>_id)).text == price
	end

	

end

