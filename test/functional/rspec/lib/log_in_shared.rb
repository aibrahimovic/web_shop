shared_context "Log in" do |email,pass|

	context "click login button on navbar" do
		it "opens login page" do
			expect(@landing_page_object.verify_login_button).to eq true 
			$login_page_object=@landing_page_object.get_login_page

			expect($login_page_object.verify).to eq true
		end
	end

	context "enter login information" do
		it "enters information" do
			$login_page_object.enter_login_information(email,pass)
		end
	end

	#context "check if login button appeared" do
		#it "login button appears" do
			#expect($login_page_object.verify_login_button).to eq true
		#end
	#end

	context "click login button" do
		it "logs user" do
			@landing_page_object=$login_page_object.click_login_button
			#expect(@landing_page_object.verify_login_information).to eq true
	    end
	end
end 