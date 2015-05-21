
email = "test@gmail.com"
pass = "12345"
quantity=0


describe "Log in" do 
	
	before(:all) do
		$browser = EnvironmentHelpers.set_browser
		$browser.execute_script("window.alert = function() {}")
		$browser.driver.manage.window.maximize

		@landing_page_object=LandingPage.new ($browser)

	end

		context "loading landing page" do
			it "is loaded correctly" do
				expect(@landing_page_object.verify).to eq true

			end
		end
    
    

		context "log in" do
			include_context "Log in", email, pass
		end
	

	    context "select product" do
			include_context "Select product"
		end 

	    context "add to cart" do
				include_context "Add to cart"
		end
	

	

		context "click log out button" do
			it "logs out" do
				$cart_page_object.log_out
				#expect(@landing_page_object.verify_logout_information).to eq true
			end
		end

		#context "check cart quantity" do
			#it "is equal 1" do
				#expect($cart_page_object.verify_cart_quantity).to eq false
			#end
		#end

		context "log in" do
			include_context "Log in", email, pass
		end

	    context "click cart button" do
			it "opens cart page" do
				$cart_page_object=$product_page_object.get_cart_page
				expect($cart_page_object.verify).to eq true
				expect($cart_page_object.verify_product_image).to eq true
			end
	 	end

	 	context "clean up" do
	 		it "app is cleaned" do
	 			$cart_page_object.set_quantity(0)
	 		end
	 	end
	 	

	 			

	




	after(:all) do
		#$browser.quit
	end



end