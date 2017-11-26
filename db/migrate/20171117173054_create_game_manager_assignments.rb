class CreateGameManagerAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :game_manager_assignments do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.timestamps
    end
  end
end
