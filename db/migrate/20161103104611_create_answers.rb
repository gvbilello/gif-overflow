class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answer do |t|
      t.string :gif, null: :false
      t.boolean :best_answer
      t.references :answerer
      t.references :question

      t.timestamps(null: false)
    end
  end
end
