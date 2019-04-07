class CreateShortQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :short_questions do |t|
      t.string :question
      t.string :answer
      t.belongs_to :note, foreign_key: true

      t.timestamps
    end
  end
end
