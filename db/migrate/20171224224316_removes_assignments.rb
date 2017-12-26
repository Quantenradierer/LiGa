class RemovesAssignments < ActiveRecord::Migration[5.1]
  def change
    drop_table :roles
    drop_table :assignments
    rename_table :game_manager_assignments, :assignments
  end
end
