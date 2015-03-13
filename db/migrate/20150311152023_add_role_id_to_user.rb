#create role with rails g migration add_role_id_to_user role_id:integer

class AddRoleIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer
  end
end
