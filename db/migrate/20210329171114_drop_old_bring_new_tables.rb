class DropOldBringNewTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :variations
    drop_table :sizes
    drop_table :colors

    create_table :attributes do |t|
      t.string :name, unique: true
      t.string :value, unique: true

      t.references :attribute, foreign_key: true

      t.timestamps
    end

    create_table :variations do |t|
      t.integer :stock
      t.float :added_price
      t.string :sku, unique: true

      t.references :product, foreign_key: true

      t.timestamps
    end

    remove_column :products, :stock
    remove_column :products, :sku
    
  end
end
