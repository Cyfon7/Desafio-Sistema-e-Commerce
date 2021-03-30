class DropOldBringNewTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :variations
    drop_table :sizes
    drop_table :colors


    create_table :options do |t|
      t.string :name#, unique: true
      t.string :value#, unique: true

      #t.references :variations, foreign_key: true
      t.timestamps
    end

    create_table :variations do |t|
      #t.references :options, foreign_key: true
      t.string :name

      t.timestamps
    end 

    create_join_table :variations, :options do |t|
      t.index [:variation_id, :option_id]
      t.index [:option_id, :variation_id]

      t.timestamps
    end

    create_join_table :products, :variations do |t|
      t.index [:product_id, :variation_id]
      t.index [:variation_id, :product_id]

      t.integer :stock
      t.float :added_price
      t.string :sku, unique: true

      #t.references :variation, foreign_key: true
      #t.references :product, foreign_key: true

      t.timestamps
    end

    rename_table :products_variations, :product_variations
    rename_table :options_variations, :variation_options

    remove_column :products, :stock
    remove_column :products, :sku

    #Self Assotiation
    #add_column :variations, :variation_id, :integer, index: true
    #add_foreign_key :variations, :variations, column: :variation_id

  end
end
