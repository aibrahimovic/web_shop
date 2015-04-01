class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :billing_address
  belongs_to :shipping_address
  has_many :order_items, dependent: :destroy


  def add_order_items(order_items)
  	order_items.each do |item| 
	    self.order_item << item
	    self.save
	end
  end
 

end
