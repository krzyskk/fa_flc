class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :deck, foreign_key: true
      t.integer :initial_cards_package, array: true, default: []
      t.integer :current_cards_package, array: true, default: []
      t.boolean :ongoing, null: false, default: true
      t.timestamps
    end
  end
end
