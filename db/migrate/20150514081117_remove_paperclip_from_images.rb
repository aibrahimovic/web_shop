class RemovePaperclipFromImages < ActiveRecord::Migration
 	def change
    remove_column :images, :avatar
  end
end
