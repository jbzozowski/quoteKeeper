class RemoveStringFromQuotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :quotes, :string, :string
  end
end
