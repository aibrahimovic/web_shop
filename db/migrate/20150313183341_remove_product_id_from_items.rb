class RemoveProductIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :product_id, :integer
  end
end
