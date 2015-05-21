shared_context "Select product" do 



	context "click product button" do
		it "opens product page" do
			$product_page_object=@landing_page_object.get_product_page
			expect($product_page_object.verify).to eq true
			expect($product_page_object.verify_add_to_cart_button).to eq true
			expect($product_page_object.verify_cart_button).to eq true
			#expect($product_page_object.product_name).to eq 'Elegant shoes'
		end
	end
end