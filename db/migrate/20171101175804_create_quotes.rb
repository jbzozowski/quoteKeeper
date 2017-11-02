class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.text :quote
      t.string :author
      t.string :string
      t.string :category_id

      t.timestamps
    end
  end
end
