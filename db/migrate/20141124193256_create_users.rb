class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, presence: true
      t.string :password_digest
      t.string :session_token
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
