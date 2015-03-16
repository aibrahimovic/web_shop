class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :surname
      t.string :address_name
      t.string :city
      t.string :region
      t.string :zip
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
