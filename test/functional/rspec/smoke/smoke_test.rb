describe "Smoke test" do 

	$email = "admin@gmail.com"
	$pass = "12345"
	$url = "https://stripe.com/"
	$stripe_email = "test.atlant@gmail.com"
	$stripe_pass = "Koliko12" 
	
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
		#expect($addresses_page_object.verify).to eq true
		end
	end

	context "enter address information and proceed" do
		include_context "Enter addresses"
	end

	context "click button to proceed to addresses" do
			it "button is clicked" do
			$addresses_page_object.get_address_page2
		end
	end

	context "check address information" do
		it "information is checked" do
			#expect($addresses_page_object.check_header).to eq true
			
			expect($addresses_page_object.check_name).to eq true
			expect($addresses_page_object.check_address).to eq true
			expect($addresses_page_object.check_city).to eq true
			expect($addresses_page_object.check_region).to eq true
			expect($addresses_page_object.check_zip).to eq true
			expect($addresses_page_object.check_state).to eq true
			expect($addresses_page_object.check_phone).to eq true

			#expect($addresses_page_object.check_name_b).to eq true
			#expect($addresses_page_object.check_address_b).to eq true
			#expect($addresses_page_object.check_city_b).to eq true
			#expect($addresses_page_object.check_region_b).to eq true
			#expect($addresses_page_object.check_zip_b).to eq true
			#expect($addresses_page_object.check_state_b).to eq true
			#expect($addresses_page_object.check_phone_b).to eq true
			#expect($addresses_page_object.check_header2_information).to eq true

		end
	end

	context "click button to proceed to payment, enter payment information and pay" do
		it "payment popup opened, information was entered and item(s) paid" do
			$confirmation_page_object=$addresses_page_object.get_payment_popup
			#expect($payment_page_object.verify).to eq true
		end
	end

	context "check confirmation page" do
		it "confirmation page is loaded" do

			expect($confirmation_page_object.message_content).to eq true
		end
	end

	context "clean up with admin user" do
		it "cleaned up" do
			$login_page_object=@landing_page_object.get_login_page
			#$login_page_object=$confirmation_page_object.get_login_page
			$login_page_object.enter_login_information($email, $pass)
			$landing_page_object=$login_page_object.click_login_button
			$admin_page_object=$landing_page_object.get_admin_page_products
			##$admin_page_object=$login_page_object.get_admin_page
			##expect($admin_page_object.verify).to eq true
			$admin_edit_page_object=$admin_page_object.get_admin_page_edit
			#expect($admin_edit_page_object.verify).to eq true
			$admin_variant_page_object=$admin_edit_page_object.get_variant_page
			#expect($admin_variant_page_object.verify).to eq true
			$admin_variant_page_object.enter_size
			$admin_variant_page_object.enter_quantity
			$admin_variant_page_object.click_add_variation_button
		end
	end

	#context "check stripe account" do
		#it "account showed last transaction" do
			#@browser.goto $url
			#$signin_btn=select_element(@browser.a(:href => 'https://dashboard.stripe.com/login')).wait_until_present
			#$signin_btn.click

			#$email_txt=select_element(@browser.input(:id => 'email')).wait_until_present
			#$email_txt.click
			#$email_txt.set $stripe_email

			#$pass_txt=select_element(@browser.input(:id => 'password')).wait_until_present
			#$pass_txt.click
			#$pass_txt.set $stripe_email
		#end
	#end



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




