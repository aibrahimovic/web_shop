class Item < ActiveRecord::Base
  
  VALID_NUMBER_REGEX = /\A[0-9]\z/
  validates :quantity, presence: true, numericality: { only_integer: true }

  belongs_to :cart
  belongs_to :help_product
  belongs_to :product
end
