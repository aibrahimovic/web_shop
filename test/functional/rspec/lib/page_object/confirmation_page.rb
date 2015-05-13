class ConfirmationPage < PageContainer

#verify 

	def verify
				
		Watir::Wait.until { @browser.url =='http://intense-hamlet-5821.herokuapp.com/' }
				
		return @browser.url == 'http://intense-hamlet-5821.herokuapp.com/'
			    
	end

	def verify_message

		select_element(@browser.div(:id => 'poruka')).wait_until_present
		return select_element(@browser.div(:id => 'poruka')).exist?
	end


	def verify_message_content
      select_element(@browser.div(:text => 'Uspješno ste platili svoju narudžbu. Ukoliko želite, možete nastaviti sa kupovinom ')).wait_until_present
		return select_element(@browser.div(:text => 'Uspješno ste platili svoju narudžbu. Ukoliko želite, možete nastaviti sa kupovinom ')).exist?
	end

	#element getters

	def message
		
		select_element(@browser.div(:id => 'poruka')).wait_until_present
		return select_element(@browser.div(:id => 'poruka')).text
	end

	#actions 

	

end


