describe "Smoke test" do 
	
	before(:all) do
		$browser = EnvironmentHelpers.set_browser
		$browser.driver.manage.window.maximize
		@landing_page_object=LandingPage.new ($browser)

	end

	context "loading landing page" do
		it "opens landing page" do
			expect(@landing_page_object.verify). to eq true
			expect(@landing_page_object.verify_product_button).to eq true

		end
	end

	context "select product" do
		include_context "Select product"
	end
	

	context "add to cart" do
			include_context "Add to cart"
	end

    context "click proceed button" do
		it "opens addresses page" do
			$addresses_page_object=$cart_page_object.get_addresses_page
			expect($addresses_page_object.verify).to eq true
		end
	end

	context "enter address information and proceed" do
			include_context "Enter addresses"
	end

	context "click proceed to payment button" do
		it "opens payment page" do
			$payment_page_object=$addresses_page_object.get_payment_page
			expect($payment_page_object.verify).to eq true
		end
	end

	context "enter payment information and pay" do
			include_context "Payment"
	end

	


	after(:all) do
		$browser.quit
	end

	
end

#describe "Clean" do

	#context "browser go back" do
		#it "goes back" do
			#@browser.back
			#@browser.cle
		#end
	#end


	#context "click ok button" do
		#it "deletes product" do
			#$cart_page_object.click_ok_button
		#end
	#end
#end




