class AdminPageVariants < PageContainer
    
	#verify
	def verify
		
    	Watir::Wait.until { @browser.url.include? '/help_products/new?product_id=1' }
    	return @browser.url.include? '/help_products/new?product_id=1'
    end


    #element getters
	

	def size
		select_element(@browser.text_field(:id => 'help_product_size')).wait_until_present
		return select_element(@browser.text_field(:id => 'help_product_size'))
	end

	def quantity
		select_element(@browser.text_field(:id => 'help_product_quantity')).wait_until_present
		return select_element(@browser.text_field(:id => 'help_product_quantity'))
	end

	def add_variation_button
		select_element(@browser.button(:id => 'add_help_product_button')).wait_until_present
		return select_element(@browser.button(:id => 'add_help_product_button'))
	end



	#actions
	
	def enter_size
		size.click
		size.set '43'
	end

	def enter_quantity
		quantity.click
		quantity.set '1'
	end

	def click_add_variation_button
		add_variation_button.click
	end

end