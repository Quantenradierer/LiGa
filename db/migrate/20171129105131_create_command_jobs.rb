class CreateCommandJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :command_jobs do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.string :worker
      t.string :params
      t.text :output, default: ''
      t.timestamp :executed_at
      t.timestamps
    end
  end
end
