class RemoveCategoryIdFromQuotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :quotes, :category_id, :string
  end
end
