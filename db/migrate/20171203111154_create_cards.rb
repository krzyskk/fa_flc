class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.datetime :created
      t.datetime :updated
      t.integer :showed
      t.integer :corect
      t.datetime :last_showed
      t.timestamps
    end
  end
end
