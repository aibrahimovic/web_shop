class ProductPage < PageContainer

	#url="http://intense-hamlet-5821.herokuapp.com/categories/1/products/3"
	#verify
    
    

	def verify
		
    	Watir::Wait.until { @browser.url.include? 'products/7' }
  		#end
		#return select_element(@browser.div(:class => 'page-wrap').div(:class => 'container-fluid')).exist?
		
		return @browser.url.include? 'products/7'
	    
	end

	def verify_add_to_cart_button
		select_element(@browser.input(:id => 'add_to_cart')).wait_until_present
		return select_element(@browser.input(:id => 'add_to_cart')).exist?
		
	end

	def verify_cart_button
		select_element(@browser.a(:class => 'nav_link', :href => '/carts')).wait_until_present
		return select_element(@browser.a(:class => 'nav_link', :href => '/carts')).exist?
	end

	def verify_cart_quantity
    	Watir::Wait.until { @browser.li(:id => 'shopping-cart').li(:class => 'counter').exist?}
    	select_element(@browser.li(:id => 'shopping-cart').li(:class => 'counter')).wait_until_present
		select_element(@browser.li(:id => 'shopping-cart').li(:class => 'counter')).exist?
		return select_element(@browser.li(:id => 'shopping-cart').li(:class => 'counter')).text == "1"

    end

    def verify_product_price(price)
		select_element(@browser.span(:id=>'price_7')).wait_until_present
		return select_element(@browser.span(:id =>'price_7')).text == price
	end

	def quantity_field
		select_element(@browser.text_field(:id=>'product_quantity_field_id')).wait_until_present
		return select_element(@browser.text_field(:id=>'product_quantity_field_id'))
	end

	#element getters
	def add_to_cart_button
		select_element(@browser.input(:id => 'add_to_cart')).wait_until_present
		return select_element(@browser.input(:id => 'add_to_cart'))
	end

	def cart_button
		
		select_element(@browser.a(:class => 'nav_link', :href => '/carts')).wait_until_present
		return select_element(@browser.a(:class => 'nav_link', :href => '/carts'))
	end

	def product_name
		select_element(@browser.b(:text => 'Elegant shoes')).wait_until_present
		return select_element(@browser.b(:text => 'Elegant shoes')).text
	end

	def size
		select_element(@browser.select_list(:id => 'all_sizes'))
	end


	#actions
	def add_to_cart
		add_to_cart_button.click
	end

	def get_cart_page
		cart_button.click
		return CartPage.new(@browser)
	end

	def change_size
		size.select '42'
	end

	def set_quantity(quantity)
		quantity_field.click
		quantity_field.set quantity
		
	end
			


end
