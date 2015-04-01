class RemoveActiveFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :active, :integer
  end
end
