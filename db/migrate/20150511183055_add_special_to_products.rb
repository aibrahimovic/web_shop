class AddSpecialToProducts < ActiveRecord::Migration
  def change
    add_column :products, :special, :string
  end
end
