class Item < ActiveRecord::Base
  
  VALID_NUMBER_REGEX = /\A[0-9]\z/
  validates :quantity, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 1 }

  belongs_to :cart
  belongs_to :help_product
  belongs_to :product




end
