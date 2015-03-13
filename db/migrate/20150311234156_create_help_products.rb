class CreateHelpProducts < ActiveRecord::Migration
  def change
    create_table :help_products do |t|
      t.string :size
      t.integer :quantity
      t.references :product, index: true

      t.timestamps
    end
  end
end
