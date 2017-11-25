class CreateGametypes < ActiveRecord::Migration[5.1]
  def change
    create_table :gametypes do |t|
      t.string :name
      t.string :shortname
      t.text :description
      t.text :configs

      t.timestamps
    end
  end
end
