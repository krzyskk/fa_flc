class AddCorrectWrongEmptyToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :correct, :integer, default: 0
    add_column :lessons, :wrong, :integer, default: 0
    add_column :lessons, :empty, :integer, default: 0
  end
end
