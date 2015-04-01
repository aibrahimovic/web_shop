class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :billing_address, index: true
      t.references :shipping_address, index: true
      t.string :total

      t.timestamps
    end
  end
end
