class AddMainToImages < ActiveRecord::Migration
  def change
    add_column :images, :main, :string
  end
end
