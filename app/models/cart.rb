class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  include ActionView::Helpers::NumberHelper

  DELIVERY_COST = 5

  def add_item(item)
  	cart_item = self.items.find_by(help_product_id: item.help_product_id)
  	if cart_item 
      if !item.quantity.nil?
    		cart_item.quantity += item.quantity
    		if cart_item.save
          return true
        end
      end
  	else 
      self.items << item
  		if self.save
        return true
      end
  	end

    false
  end

  def add_item_to_temporary_cart(item)
    item.cart_id = 0
    item.save
  end

  def delete_item_from_temporary_cart(item)

  end

  def get_delivery_price
    
    total = 0
    self.items.each do |item|
      total += item.quantity*DELIVERY_COST
    end
    pom = total.to_s << ".00"

    pom
  end

  def get_total_number
    total = 0
    self.items.each do |item|
      total += item.quantity
    end

    total
  end

  def get_total_price 
    total = 0
    self.items.each do |item|
      total += item.quantity * item.help_product.product.price.to_f
    end
    total = total.to_s << "0"
    total = number_with_precision(total, :precision => 2)

    total
  end

  def get_total_with_delivery
    total = get_delivery_price.to_f + get_total_price.to_f
    total = total.to_s << "0"
    total = number_with_precision(total, :precision => 2)

    total
  end

  def update_item (item_id, quantity)

    item = self.items.find_by(id: item_id)

    if item 
      item.quantity = quantity
      get_total_with_delivery
      item.save
      return true
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

  def count_prices 
    return [get_total_number, get_total_price, get_delivery_price, get_total_with_delivery]
  end

  def temporary_cart_count_prices 
    c = Cart.find_by(id: 0)
    return [c.get_total_number, c.get_total_price, c.get_delivery_price, c.get_total_with_delivery]
  end

end
