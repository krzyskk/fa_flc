class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.datetime :started_at
      t.belongs_to :deck, foreign_key: true
      t.integer :correct_answers, default: 0, null: false
      t.integer :wrong_answers, default: 0, null: false
      t.timestamps
    end
  end
end
