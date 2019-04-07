class AddFieldsToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :familiarity, :integer, null: false, default: 0
    add_column :notes, :completation, :integer, null: false, default: 0
  end
end
 