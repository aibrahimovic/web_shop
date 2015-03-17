class AddAddressTagToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :tag, :string
  end
end
