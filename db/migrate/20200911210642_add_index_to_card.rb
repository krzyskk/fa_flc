class AddIndexToCard < ActiveRecord::Migration[6.0]
  def change
    add_index :cards, [:front, :back, :word_class, :deck_id], unique: true
  end
end
