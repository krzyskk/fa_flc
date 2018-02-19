class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.boolean :active, default: true
      t.boolean :memorized, default: false
      t.integer :correct_answers, default: 0, null: false
      t.integer :wrong_answers, default: 0, null: false
      t.integer :empty_answers, default: 0, null: false
      t.datetime :last_showed_at
      t.datetime :marked_as_memorized
      t.belongs_to :deck, foreign_key: true
      t.timestamps
    end
  end
end
