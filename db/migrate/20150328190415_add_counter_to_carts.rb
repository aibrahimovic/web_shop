class AddCounterToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :counter, :integer
  end
end
