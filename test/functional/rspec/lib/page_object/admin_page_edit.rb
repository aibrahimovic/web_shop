class AdminPageEdit < PageContainer
    
	#verify
	def verify
		
    	Watir::Wait.until { @browser.url.include? '/products/1/edit' }
    	return @browser.url.include? '/products/1/edit'
    end


    #element getters
	

	def variants_link
		select_element(@browser.a(:href => '/help_products/new?product_id=260')).wait_until_present
		return select_element(@browser.a(:href => '/help_products/new?product_id=260'))
	end


	#actions
	
	def get_variant_page
		variants_link.click
		@browser.refresh
		return AdminPageVariants.new(@browser)
		
	end

end