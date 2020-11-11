class AddSpreadsheetNameToDeck < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :spreadsheet_name, :string
  end
end
