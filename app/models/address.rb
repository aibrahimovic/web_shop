class Address < ActiveRecord::Base
	#validates :name, :address_name, :city, :region, :zip, :state, :phone, presence: true
	belongs_to :user
end
