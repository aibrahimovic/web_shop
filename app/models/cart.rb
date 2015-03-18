class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  DELIVERY_COST = 5

  def add_item(item)
  	cart_item = self.items.find_by(help_product_id: item.help_product_id)
  	if cart_item 
  		cart_item.quantity += item.quantity
  		cart_item.save
  	else 
      self.items << item
  		self.save
  	end
    get_total_with_delivery
  end

  def get_delivery_price
    return DELIVERY_COST
  end

  def get_total_price 
    total = 0
    self.items.each do |item|
      total += item.quantity * item.help_product.product.price.to_i
    end

    total
  end

  def get_total_with_delivery
    return get_delivery_price + get_total_price
  end

  def update_item (item_id, quantity)

    item = self.items.find_by(id: item_id)

    if item
      get_total_with_delivery
      item.quantity = quantity
      return item.save

    end 

    false
  end

  def delete_item (item_id)

    item = self.items.find_by(id: item_id)
    if item.destroy
      get_total_with_delivery
      return true
    end
    
    false
  end
end
