class CreateCoupon < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :title
      t.text :conditions
      t.integer :discount
      t.float :amount
      t.string :remaining_uses
      t.string :code
      t.date :expires_at
      t.string :user_authorized
    end
  end
end
