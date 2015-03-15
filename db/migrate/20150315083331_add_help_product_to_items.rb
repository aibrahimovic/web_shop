class AddHelpProductToItems < ActiveRecord::Migration
  def change
    add_reference :items, :help_product, index: true
  end
end
