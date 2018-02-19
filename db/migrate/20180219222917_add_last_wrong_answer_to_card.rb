class AddLastWrongAnswerToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :last_wrong_answer, :datetime
  end
end
