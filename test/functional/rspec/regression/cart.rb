describe "Cart functionalities" do 
	
	#before(:each) do
    #$email=$signup_page_object.get_email
	#$pass=$signup_page_object.get_pass
  	#end

	before(:all) do
		$browser = EnvironmentHelpers.set_browser
		$browser.driver.manage.window.maximize
		@landing_page_object=LandingPage.new ($browser)

	end

	context "loading landing page" do
		it "is loaded correctly" do
			expect(@landing_page_object.verify).to eq true
			#expect(@landing_page_object.verify_signup_link).to eq true

		end
	end


	context "select product" do
		include_context "Select product"
	end
	
	context "check cart price" do
		it "price is correct" do
			expect($product_page_object.verify_product_price("130.00")).to eq true
		end
	end

	context "change quantity" do
		it "quantity is changed" do
			$product_page_object.set_quantity(3)
		end
	end



	context "click add to cart button" do
		it "adds product to the cart" do
			$product_page_object.add_to_cart
		end
	end

	context "change size" do 
		it "size is changed" do
			$product_page_object.change_size
		end
	end

	context "click add to cart button" do
		it "adds product to the cart" do
			$product_page_object.add_to_cart
		end
	end


	context "click cart button" do
		it "opens cart page" do
			$cart_page_object=$product_page_object.get_cart_page
			expect($cart_page_object.verify).to eq true
			#expect($cart_page_object.product_name).to eq 'Elegant shoes'
			expect($cart_page_object.verify_cart_quantity(4)).to eq true
		end
	end

  
	

	context "check cart price" do
		it "price is correct" do
			expect($cart_page_object.verify_product_price("520.00")).to eq true
		end
	end

	#context "check cart price of the 1st product" do
		#it "price is correct" do
			#expect($cart_page_object.check_product_price('515', "390")).to eq true
		#end
	#end

	#context "check cart price of the 2nd product" do
		#it "price is correct" do
			#expect($cart_page_object.check_product_price('255', "130")).to eq true
		#end
	#end



	after(:all) do
		#$browser.quit
	end

end
