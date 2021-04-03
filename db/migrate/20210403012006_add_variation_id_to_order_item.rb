class AddVariationIdToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :variation_id, :integer
  end
end
