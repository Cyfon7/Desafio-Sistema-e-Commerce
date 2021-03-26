class AddIndexNameToCategories < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :name, unique: true
    add_column :categories, :category_id, :integer
  end
end
