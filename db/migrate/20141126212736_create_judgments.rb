class CreateJudgments < ActiveRecord::Migration
  def change
    create_table :judgments do |t|
      t.integer :prediction_id, null: false
      t.integer :user_id, null: false
      t.string :status, default: 'undetermined'

      t.timestamps
    end
    add_index(:judgments, :prediction_id)
    add_index(:judgments, :user_id)
  end
end
