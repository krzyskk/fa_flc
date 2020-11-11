class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.string :name
      t.string :type
      t.belongs_to :day, foreign_key: true
      t.timestamps
    end
  end
end
