class AddSizeAndQuantityToItems < ActiveRecord::Migration
  def change
    add_column :items, :size, :string
    add_column :items, :quantity, :integer
  end
end
