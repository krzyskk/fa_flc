class AddSuccessToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :success, :boolean
  end
end
