class FixRoleNameToUserRole < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :role_id, :user_role_id
  end
end
