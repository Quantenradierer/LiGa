class AddGameStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :status, :int, default: 0
  end
end
