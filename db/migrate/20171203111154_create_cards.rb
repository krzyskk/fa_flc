class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.integer :correct_answers
      t.integer :showed_questions
      t.datetime :last_showed_at
      t.timestamps
    end
  end
end
