class AddsGametypeToGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :gameserver, :string
    add_reference :games, :gametype, index: true
  end
end
