class Product < ApplicationRecord
  has_and_belongs_to_many :categories, dependent: :destroy

  has_many :variations, dependent: :destroy

  accepts_nested_attributes_for :variations, :categories

  
  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy

  
end
