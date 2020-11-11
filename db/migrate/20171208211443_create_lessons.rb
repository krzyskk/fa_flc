class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :deck, foreign_key: true
      t.integer :memorized, default: 0, null: false
      t.timestamps
    end
  end
end
