class AddsRightsToGamemanagerAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :game_manager_assignments, :rights, :int
  end
end
