class Variation < ApplicationRecord
    has_and_belongs_to_many :item_attributes, dependent: :destroy

    #belongs_to :product

    def self.product_list
        x = Variation.select(:product_id).distinct.pluck(:product_id)
        Product.where(id: x)
    end

end

