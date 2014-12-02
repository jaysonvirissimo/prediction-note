class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author, null: false
      t.string :quote, null: false

      t.timestamps
    end
  end
end
