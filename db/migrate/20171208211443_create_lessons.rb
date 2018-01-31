class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :deck, foreign_key: true
      t.integer :correct_answers, default: 0, null: false
      t.integer :wrong_answers, default: 0, null: false
      t.integer :empty_answers, default: 0, null: false
      t.integer :marked_as_memorized, default: 0, null: false
      t.timestamps
    end
  end
end
