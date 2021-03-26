class Product < ApplicationRecord
  has_and_belongs_to_many :categories, dependent: :destroy

  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy

  has_many :variations, dependent: :destroy
end
