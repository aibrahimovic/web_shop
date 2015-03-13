class RemoveProductFormItems < ActiveRecord::Migration
  def change
  	remove_column :items, :product_id
  end
end
