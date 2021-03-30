class Variation < ApplicationRecord
    has_many :products_variations
    has_many :products, through: :product_variations, dependent: :destroy

    def self.product_list
        x = Variation.select(:product_id).distinct.pluck(:product_id)
        Product.where(id: x)
    end

end

