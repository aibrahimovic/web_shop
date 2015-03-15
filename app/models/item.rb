class Item < ActiveRecord::Base
  belongs_to :cart
  belongs_to :help_product
end
