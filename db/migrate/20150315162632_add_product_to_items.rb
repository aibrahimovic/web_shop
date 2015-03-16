class AddProductToItems < ActiveRecord::Migration
  def change
    add_reference :items, :product, index: true
  end
end
