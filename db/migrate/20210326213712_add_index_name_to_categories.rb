class AddIndexNameToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :category_id, :integer, index: true
    add_foreign_key :categories, :categories, column: :category_id
  end
end
