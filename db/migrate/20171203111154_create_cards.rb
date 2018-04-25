class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front, null: false, default: ''
      t.text :back, null: false, default: ''
      t.boolean :active, null: false, default: true
      t.boolean :memorized, null: false, default: false
      t.integer :correct_answers, null: false, default: 0
      t.integer :wrong_answers, null: false, default: 0
      t.integer :empty_answers, null: false, default: 0
      t.integer :word_class, null: false, default: 0
      t.datetime :last_showed_at
      t.datetime :marked_as_memorized
      t.datetime :last_correct_answer
      t.datetime :last_wrong_answer
      t.belongs_to :deck, foreign_key: true
      t.timestamps
    end
    add_index :cards, [:front, :back, :word_class], unique: true
  end
end
