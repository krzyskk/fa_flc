class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :deck, foreign_key: true
      t.integer :number_of_correct, default: 0, null: false
      t.integer :number_of_wrong, default: 0, null: false
      t.integer :number_of_empty, default: 0, null: false
      t.timestamps
    end
  end
end
