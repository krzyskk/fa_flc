class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.datetime :started_at
      t.integer :wrong_answers
      t.integer :correct_answers
      t.integer :current_question
      t.integer :previous_question
      t.timestamps
    end
  end
end
