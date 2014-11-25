class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :user_id, null: false
      t.string :statement, null: false
      t.datetime :deadline, null: false

      t.timestamps
    end
    add_index(:predictions, :user_id)
  end
end
