class RemoveColumnsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :stock
    remove_column :products, :sku
  end
end
