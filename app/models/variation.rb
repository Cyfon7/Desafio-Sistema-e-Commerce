class Variation < ApplicationRecord
    belongs_to :color

    belongs_to :size
    belongs_to :product

    def self.product_list
        x = Variation.select(:product_id).distinct.pluck(:product_id)
        Product.where(id: x)
    end

end

