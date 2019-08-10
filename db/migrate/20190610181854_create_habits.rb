class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.integer :repeat_type 
      t.string :repeat_pattern 
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
