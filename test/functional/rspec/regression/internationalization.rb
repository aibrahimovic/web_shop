describe "Internationalization" do 
	
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

	context "change language" do
		it "language is changed" do
			@landing_page_object.change_language
		end
	end

	context "check categories" do
		it "categories are translated" do
			expect(@landing_page_object.check_category_names).to eq true
		end
	end

	context "check title" do
		it "title is translated" do
			expect(@landing_page_object.check_title).to eq true
		end
	end

	context "check registration field" do
		it "registration field is translated" do
			expect(@landing_page_object.check_registration_field).to eq true
		end
	end
	context "check login field" do
		it "registration field is translated" do
			expect(@landing_page_object.check_login_button).to eq true
		end
	end

	context "click login button on navbar" do
		it "opens login page" do
			expect(@landing_page_object.verify_login_button).to eq true 
			$login_page_object=@landing_page_object.get_login_page

			expect($login_page_object.verify).to eq true
		end
	end

	context "check login title" do
		it "title is translated" do
			expect($login_page_object.check_title).to eq true
		end
	end

	context "check pass label" do
		it "label is translated" do
			expect($login_page_object.check_pass_label).to eq true
		end
	end

	context "check email label" do
		it "label is translated" do
			expect($login_page_object.check_email_label).to eq true
		end
	end


	context "click registration button on navbar" do
		it "opens signup page" do
			#expect(@landing_page_object.verify_login_button).to eq true 
			$signup_page_object=$login_page_object.get_signup_page

			expect($signup_page_object.verify).to eq true
		end
	end


	context "check signup title" do
		it "title is translated" do
			expect($signup_page_object.check_title).to eq true
		end
	end

	context "check pass label" do
		it "label is translated" do
			expect($signup_page_object.check_pass).to eq true
		end
	end

	context "check email label" do
		it "label is translated" do
			expect($signup_page_object.check_email).to eq true
		end
	end

	context "check pass confirmation label" do
		it "label is translated" do
			expect($signup_page_object.check_pass_confirmation).to eq true
		end
	end

	context "go to homepage" do
		it "homepage is loaded" do
			$signup_page_object.get_landing_page
			sleep 5 
		end
	end

	context "select product" do
		sleep 5
		include_context "Select product"
	end

	context "check product information"do
		it "information is correct" do
			expect($product_page_object.check_product_name).to eq true
			expect($product_page_object.check_product_description).to eq true
		end
	end

	context "check button information"do
		it "information is correct" do
			expect($product_page_object.check_add_to_cart_button).to eq true
			expect($product_page_object.check_buy_button).to eq true
		end
	end




	




	#context "check registration field" do
		#it "registration field is translated" do
			#expect(@landing_page_object.check_registration_field).to eq true
		#end
	#end

	#context "check item description" do
		#it "description is translated" do
			#@landing_page_object.check_product_description
		#end
	#end



	after(:all) do
		$browser.quit
	end


end