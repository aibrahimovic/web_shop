class AdminPage < PageContainer
    
	#verify
	def verify
		
    	Watir::Wait.until { @browser.url.include? '/allProducts' }
    	return @browser.url.include? '/allProducts'
    end


    #element getters
	

	def change_product_link
		select_element(@browser.a(:href => '/products/260/edit')).wait_until_present
		return select_element(@browser.a(:href => '/products/260/edit'))
	end


	#actions
	
	def get_admin_page_edit
		change_product_link.click
		@browser.refresh
		return AdminPageEdit.new(@browser)
		
	end
end