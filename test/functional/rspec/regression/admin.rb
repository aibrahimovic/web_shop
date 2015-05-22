describe "Admin" do 
	
	$email_admin= "admin@gmail.com"
	$pass_admin="12345"
	
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

	context "log in" do
			include_context "Log in", $email_admin, $pass_admin
		end


	context "open all products" do
		it "all products opened" do
			$admin_page_object=@landing_page_object.get_admin_page_products
		end
	end

	context "change one products" do
		it "admin is changed" do
			$admin_page_object=$admin_page_object.goto_correct_page
			$admin_edit_page_object=$admin_page_object.get_admin_page_edit
			$admin_variant_page_object=$admin_edit_page_object.get_variant_page
			$admin_variant_page_object.enter_size
			$admin_variant_page_object.enter_quantity
			$admin_variant_page_object.click_add_variation_button
			$admin_variant_page_object.delete_variant
		end
	end

	context "check all users" do
		it "all users were present" do
			$admin_page_object=$admin_variant_page_object.get_all_users_page
			expect($admin_page_object.check_all_users).to eq true
		end
	end

	context "check all orders" do
		it "all orders were present" do
			$admin_page_object.get_all_orders
		end
	end

	context "check all categories" do
		it "all categories were present" do
			$admin_page_object.get_all_categories
		end
	end

	after(:all) do
		$browser.quit
	end



end