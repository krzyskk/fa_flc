class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.belongs_to :lesson, foreign_key: true
      t.belongs_to :card, foreign_key: true
      t.timestamps
    end
  end
end
