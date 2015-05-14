class RemovePaperclipFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :avatar_file_name
  end
end
