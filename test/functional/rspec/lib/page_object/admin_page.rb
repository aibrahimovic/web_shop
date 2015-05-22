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
		sleep 5
		change_product_link.click
		@browser.refresh
		return AdminPageEdit.new(@browser)
		
	end

	def goto_correct_page
		select_element(@browser.a(:href => '/allProducts?page=5')).wait_until_present
		select_element(@browser.a(:href => '/allProducts?page=5')).click
		return AdminPage.new(@browser)
	end

	def delete_user(email)

		select_element(@browser.td(:text => email).parent.td(:index=>3).a(:text=>"Brisanje")).wait_until_present
		select_element(@browser.td(:text => email).parent.td(:index=>3).a(:text=>"Brisanje")).click
		
		#that_user=select_element(@browser.td(:text => email))
		#parent_tr=that_user.parent
		#select_element(@browser.parent_tr.td(:text =>"")).a.a.click
		@browser.alert.ok
		
		#brisanje.ok
		#select_element(@browser.a(:href => '/users/8')).wait_until_present
		#select_element(@browser.a(:href => '/users/8')).click

	end


end