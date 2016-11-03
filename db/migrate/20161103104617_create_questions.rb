class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: :false
      t.string :description
      t.references :author

      t.timestamps(null: false)
    end
  end
end
