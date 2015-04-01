class Address < ActiveRecord::Base
	#validates :name, :address_name, :city, :region, :zip, :state, :phone, presence: true
	belongs_to :user

	def create_address (name, address_name, city, region, zip, state, phone, user_id, tag)
		address = Address.new
		address.name = name
		address.address_name = address_name
		address.city = city
		address.region = region
		address.zip = zip
		address.state = state
		address.phone = phone
		address.user_id = user_id
		address.tag = tag

		if address.save
			return true
		end

		false
	end
end
