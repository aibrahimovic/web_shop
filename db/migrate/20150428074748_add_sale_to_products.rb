class AddSaleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sale, :string
  end
end
