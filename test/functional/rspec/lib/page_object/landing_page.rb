class LandingPage < PageContainer

	$email
	$pass
	#verify

	def verify
				
		Watir::Wait.until { @browser.url =='https://webshop-abhshoes.herokuapp.com//' }
				
		return @browser.url == 'https://webshop-abhshoes.herokuapp.com//'
			    
	end

	def verify_product_button
		#select_element(@browser.div(:id, 'featured_products').div(:index => 0).div(:index => 0).a(:href => '/categories/1/products/3')).wait_until_present
		select_element(@browser.a(:href => '/products/7')).wait_until_present
		return select_element(@browser.a(:href => '/products/7')).exist?
	end

	def verify_login_button
		select_element(@browser.a(:href => '/login')).wait_until_present
		return select_element(@browser.a(:href => '/login')).exist?
	end

	def verify_login_information
		select_element(@browser.a(:href=> '/login')).wait_until_present
		return select_element(@browser.a(:href=> '/login')).exist?
	end

	def verify_logout_information
		select_element(@browser.a(:href=> '/logout')).wait_until_present
		return select_element(@browser.a(:href=> '/logout')).exist?
	end

	def verify_signup_link
		#Watir::Wait.until { @browser.button(:class => 'btn btn-default').exist? }
		select_element(@browser.a(:href => '/users/new')).wait_until_present
		return select_element(@browser.a(:href => '/users/new')).exist?
	end



	#element getters
	def product_button
		#select_element(@browser.div(:id, 'featured_products').div(:index => 0).div(:index => 0).a(:href => '/categories/1/products/10')).wait_until_present
		select_element(@browser.a(:href => '/products/7')).wait_until_present
		return select_element(@browser.a(:href => '/products/7'))
	end

	def product_picture
		select_element(@browser.img(:alt => 'Untitled 10')).wait_until_present
		return select_element(@browser.img(:alt => 'Untitled 10'))
		
	end

	def login_button
		select_element(@browser.a(:href => '/login')).wait_until_present
		return select_element(@browser.a(:href => '/login'))
	end

	def login_information
		select_element(@browser.span(:class => 'navbar-text')).wait_until_present
		return select_element(@browser.span(:class => 'navbar-text'))
	end

	def signup_link
		select_element(@browser.a(:href => '/users/new')).wait_until_present
		return select_element(@browser.a(:href => '/users/new'))
	end

	def cart_button
		
		select_element(@browser.a(:class => 'nav_link', :href => '/carts')).wait_until_present
		return select_element(@browser.a(:class => 'nav_link', :href => '/carts'))
	end

	def bs_button
		select_element(@browser.a(:href => '/change_locale/bs')).wait_until_present
		return select_element(@browser.a(:href => '/change_locale/bs'))
	end

	def zenska_obuca
		#Watir::Wait.until { select_element(@browser.a(:href => '/categories/4')).present? }
		select_element(@browser.a(:href => '/categories/4')).wait_until_present
		return select_element(@browser.a(:href => '/categories/4'))
	end

	def muska_obuca
		#Watir::Wait.until { select_element(@browser.a(:href => '/categories/5')).present? }
		select_element(@browser.a(:href => '/categories/5')).wait_until_present
		return select_element(@browser.a(:href => '/categories/5'))
	end

	def sportska_obuca
		#Watir::Wait.until { select_element(@browser.a(:href => '/categories/6')).present? }
		select_element(@browser.a(:href => '/categories/6')).wait_until_present
		return select_element(@browser.a(:href => '/categories/6'))
	end

	def naslov
		select_element(@browser.h2).wait_until_present
		return select_element(@browser.h2)
	end



	#actions

	def get_product_page
		product_button.click
		return ProductPage.new(@browser)
	end

	def get_login_page
		login_button.click
		return LoginPage.new(@browser)
	end

	def get_signup_page
		signup_link.click
		return SignupPage.new(@browser)
	end

	def get_cart_page
		cart_button.click
		return CartPage.new(@browser)
	end

	def change_language
		bs_button.click
		@browser.refresh
		Watir::Wait.until { zenska_obuca.present? }
		Watir::Wait.until { muska_obuca.present? }
	end

	def check_category_names
		Watir::Wait.until { zenska_obuca.present? }
		Watir::Wait.until { muska_obuca.present? }
		Watir::Wait.until { sportska_obuca.present? }
		return zenska_obuca.text == "ŽENSKA OBUćA" && muska_obuca.text == "MUšKA OBUćA"	&& sportska_obuca.text == "SPORTSKA OBUćA"
	end

	def check_title
		
		return naslov.text == "Proizvodi na sniženju"
	end

	def check_registration_field
		
		return signup_link.text == "Registracija"	
	end
	def check_product_description
		#puts select_element(@browser.a(:href => '/products/7').div(:class=> 'image')).attribute_value('datacontent1')
		return select_element(@browser.a(:href => '/products/7').div(:class=> 'image')).attribute_value('datacontent1') == "Elegantne cipele"
	end

	




end

