class RemoveIndexFromCards < ActiveRecord::Migration[6.0]
  def change
    remove_index "cards", name: "index_cards_on_front_and_back_and_word_class"
  end
end
