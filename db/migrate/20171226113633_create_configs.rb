class CreateConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :configs do |t|
      t.references :gametype, foreign_key: true
      t.integer :priority
      t.string :configurator
      t.string :file
      t.string :key
      t.integer :datatype
      t.integer :constraint

      t.timestamps
    end
  end
end
