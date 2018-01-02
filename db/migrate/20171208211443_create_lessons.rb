class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.datetime :started_at
      t.integer :correct_answers
      t.integer :showed_questions
      t.integer :current_question
      t.integer :previous_question
      t.string :answer
      t.timestamps
    end
  end
end
