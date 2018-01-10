class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.belongs_to :lesson, foreign_key: true
      t.belongs_to :card, foreign_key: true
      t.string :answer
      t.string :status
      t.timestamps
    end
  end
end
