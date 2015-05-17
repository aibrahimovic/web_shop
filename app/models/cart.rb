class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  include ActionView::Helpers::NumberHelper

  DELIVERY_COST = 5

  def add_item(item)

  	cart_item = self.items.find_by(help_product_id: item.help_product_id)
  	if cart_item 
      #price = cart_item.price
      #new_item_price = item.help_product.product.get_price
      #if price == new_item_price
        if !item.quantity.nil?
      		cart_item.quantity += item.quantity
      		if cart_item.save
            return true
          end
        end
      
  	else

      item.price = item.help_product.product.get_price.to_f*item.quantity
      item.price = item.price.to_s << "0"
      item.price = number_with_precision(item.price, :precision => 2)
      
      self.items << item
  		if self.save
        item.save
        return true
      end
  	end

    false
  end

  def add_item_to_temporary_cart(item)
    item.tag= 0
    item.save
  end

  def get_delivery_price
    total = 0
    item = Item.find_by(tag: 0)
    if item.nil?
      self.items.each do |item|
        total += item.quantity*DELIVERY_COST
      end
    else
      total = item.quantity*DELIVERY_COST
    end
    pom = total.to_s << ".00"

    pom
  end

  def get_total_number
    total = 0
    item = Item.find_by(tag: 0)
    if item.nil?
      self.items.each do |item|
        total += item.quantity
      end
    else
      total = item.quantity
    end
    total
  end

  def get_total_price 
    total = 0
    item = Item.find_by(tag: 0)
    if item.nil?
      self.items.each do |item|
        #total += item.quantity * item.help_product.product.price.to_f
        total += item.quantity * item.price.to_f
      end
    else
      #total = item.quantity * item.help_product.product.price.to_f
      total = item.quantity * item.price.to_f
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

  def check
    products = []
    product_names = []
    quantities = []
    items = []
    all_items = self.items
    all_items.each do |item|
      if item.help_product.quantity < item.quantity
        products << item.help_product_id
        product_names << item.help_product.product.name
        quantities << item.help_product.quantity
        items << item.id
      end
    end 
    return products, product_names, quantities, items
  end

end
