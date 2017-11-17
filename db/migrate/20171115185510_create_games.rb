class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :servername
      t.string :location
      t.string :path
      t.text :output

      t.timestamps
    end
  end
end
