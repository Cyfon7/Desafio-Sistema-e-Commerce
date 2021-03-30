class Variation < ApplicationRecord
    has_many :products_variations
    has_many :products, through: :product_variations, dependent: :destroy

  #Self Assotiation
  has_many :subvariation, class_name: "Variation", foreign_key: "variation_id", dependent: :destroy
  belongs_to :variation, class_name: "Variation", optional: true


    def self.product_list
        x = Variation.select(:product_id).distinct.pluck(:product_id)
        Product.where(id: x)
    end

end

