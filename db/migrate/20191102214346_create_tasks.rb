class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :color
      t.integer :priority
      t.boolean :done
      t.belongs_to :day, foreign_key: true
      t.datetime :finished_at

      t.timestamps
    end
  end
end
