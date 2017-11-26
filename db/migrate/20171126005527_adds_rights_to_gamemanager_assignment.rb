class AddsRightsToGamemanagerAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :game_manager_assignments, :rights, :int, default: 1
    add_index :game_manager_assignments, [:user_id, :game_id], unique: true
  end
end
