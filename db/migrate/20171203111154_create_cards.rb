class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.belongs_to :deck, foreign_key: true
      t.string :front, null: false, default: ''
      t.string :back, null: false, default: ''
      t.integer :status, null: false, default: 0
      t.integer :correct_answers_in_a_row, null: false, default: 0
      t.datetime :marked_as_memorized_date
      t.timestamps
    end
    add_index :cards, [:front, :back, :deck_id], unique: true
  end
end
