require 'pp'
#require './lib/page_object/signup_page'
#$email=""
#$pass=""
describe "Sign up" do 
	$email= "#{Time.now.strftime("%s")}@test.com"
	$pass= "testtest"
	
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
				expect(@landing_page_object.verify_signup_link).to eq true

		end
	end


	context "select product" do
		include_context "Select product"
	end
	

	context "add to cart" do
		include_context "Add to cart"
	end

	context "open signup page" do
		it "page is opened" do
			expect(@landing_page_object.verify_signup_link).to eq true
			$signup_page_object=$cart_page_object.get_signup_page
			expect($signup_page_object.verify).to eq true

		end
	end

	context "enter user information" do
		it "information is entered" do
			$signup_page_object.enter_signup_information($email, $pass)
            

			#@landing_page_object.set_email($signup_page_object.get_email)
			#@landing_page_object.set_pass($signup_page_object.get_pass)
			#pp @landing_page_object.get_email

		end
	end

	context "click register button" do
		it "button is clicked" do
			$signup_page_object.click_registration_button
		end
	end

	#context "verify welcome message" do
		#it "message appeared" do
			#expect($signup_page_object.verify_welcome_message).to eq true
			#expect($signup_page_object.verify_message_content).to eq true
		#end
	#end

	context "click cart button" do
		it "opens cart page" do
			$cart_page_object=$signup_page_object.get_cart_page
			expect($cart_page_object.verify).to eq true
			expect($cart_page_object.verify_product_image).to eq true
			#expect($cart_page_object.verify_cart_quantity).to eq true
		end
	end

	context "click log out button" do
		it "logs out" do
			$cart_page_object.log_out
			expect($cart_page_object.verify_login_information).to eq true
		end
	end



	context "log in" do
		#expect(@email).
		#pp @email
		#pp @pass
	 	#include_context "EmailPass"
	 	#pp $email+"1"
	 	#@landing_page_object = LandingPage.new(@browser)
	 	#email=@landing_page_object.get_email
	 	#pass=@landing_page_object.get_pass
		include_context "Log in", $email, $pass
	end

	context "check if the user is logged in" do
		it "user is logged" do
			
		expect(@landing_page_object.verify_logout_information).to eq true
		end
	end
	

	after(:all) do
		$browser.quit
	end
end