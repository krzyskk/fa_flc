class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
