class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :short_answer
      t.string :question

      t.timestamps
    end
  end
end
