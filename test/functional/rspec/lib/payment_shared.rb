shared_context "Payment" do 

	context "enter payment information" do
		it "enters information" do
			$payment_page_object.enter_payment_information
		end
	end

	context "click pay button" do
		it "opens confirmation page" do
			$confirmation_page_object=$payment_page_object.get_confirmation_page
			expect($confirmation_page_object.verify).to eq true
		end
	end

	context "check confirmation message" do
		it "confirmation message is present" do
			expect($confirmation_page_object.verify_message).to eq true
		end
	end

	context "check message's content" do
		it "checks content of the message" do
			expect($confirmation_page_object.message).to match 'Uspješno ste platili svoju narudžbu. Ukoliko želite, možete nastaviti sa kupovinom'
		end
	end
end