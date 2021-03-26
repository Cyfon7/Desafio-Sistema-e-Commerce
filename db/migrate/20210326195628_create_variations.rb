class CreateVariations < ActiveRecord::Migration[5.2]
  def change
    create_table :variations do |t|
      t.integer :stock
      t.string :sku
      t.references :product, foreign_key: true
      t.references :size, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
