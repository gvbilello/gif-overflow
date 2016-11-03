class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :gif, null: :false
      t.boolean :best_answer
      t.references :answerer
      t.references :question

      t.timestamps(null: false)
    end
  end
end
