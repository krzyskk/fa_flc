class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.integer :correct_answers, default: 0, null: false
      t.integer :wrong_answers, default: 0, null: false
      t.integer :near_answers, default: 0, null: false
      t.integer :hint_answers, default: 0, null: false
      t.string :front_image
      t.datetime :last_showed_at
      t.belongs_to :deck, foreign_key: true
      t.timestamps
    end
  end
end
