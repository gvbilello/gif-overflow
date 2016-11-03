class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :username, null: :false
      t.string :email, null: :false
      t.string :password_digest

      t.timestamps(null: false)
    end
  end
end
