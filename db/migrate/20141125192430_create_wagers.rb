class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|
      t.integer :prediction_id, null: false
      t.integer :probability, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index(:wagers, :prediction_id)
    add_index(:wagers, :user_id)
  end
end
