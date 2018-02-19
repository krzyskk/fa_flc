class AddLastCorrectAnswerToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :last_correct_answer, :datetime
  end
end
