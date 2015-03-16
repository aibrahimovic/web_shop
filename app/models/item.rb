class Item < ActiveRecord::Base
  belongs_to :cart
  belongs_to :help_product
  belongs_to :product
end
