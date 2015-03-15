class RemoveHelpProductIdIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :help_product_id_id, :integer
  end
end
