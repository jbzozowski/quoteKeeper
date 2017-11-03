class DropCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :categories do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
