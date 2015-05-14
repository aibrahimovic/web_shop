class AddPaperclipToImages < ActiveRecord::Migration
  
  #def self.up
    #add_attachment :images, :avatar
  #end

  #def self.down
    #remove_attachment :images, :avatar
  #end

  def change
    add_column :images, :avatar
  end
  
end
