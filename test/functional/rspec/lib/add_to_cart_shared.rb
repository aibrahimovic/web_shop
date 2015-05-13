shared_context "Add to cart" do 

context "click add to cart button" do
		it "adds product to the cart" do
			$product_page_object.add_to_cart
			#expect($product_page_object.verify_cart_quantity).to eq true

		end
	end

	context "click cart button" do
		it "opens cart page" do
			$cart_page_object=$product_page_object.get_cart_page
			expect($cart_page_object.verify).to eq true
			#expect($cart_page_object.product_name).to eq 'Elegant shoes'
			expect($cart_page_object.verify_cart_quantity(1)).to eq true
		end
	end

	
end