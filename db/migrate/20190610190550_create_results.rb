class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :day_id
      t.integer :habit_id
      t.integer :result
      t.boolean :success, null: false, default: false

      t.timestamps
    end
  end
end
