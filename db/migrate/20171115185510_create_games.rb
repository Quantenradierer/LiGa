class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :gameserver
      t.string :name
      t.string :path
      t.text :output

      t.timestamps
    end
  end
end
