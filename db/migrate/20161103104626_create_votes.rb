class CreateVotes < ActiveRecord::Migration
  def change
    create_table :vote do |t|
      t.references :voter
      t.integer :voteable_id
      t.string :voteable_type

      t.timestamps(null: false)
    end
  end
end
