class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.datetime :date
      t.text :note 
      t.string :resolution
      t.string :main_task
      t.belongs_to :user, foreign_key: true
     
      t.timestamps
    end
  end
end
