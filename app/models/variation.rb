class Variation < ApplicationRecord
    has_many :product_variations
    has_many :products, through: :product_variations, dependent: :destroy

    #has_many :options, dependent: :destroy
    #has_and_belongs_to_many :options, dependent: :destroy
    has_many :variation_options
    has_many :options, through: :variation_options, dependent: :destroy

    #belongs_to :option

    accepts_nested_attributes_for :variation_options, allow_destroy: true

  #Self Assotiation
  #has_many :subvariation, class_name: "Variation", foreign_key: "variation_id", dependent: :destroy
  #belongs_to :variation, class_name: "Variation", optional: true


    def self.product_list
        x = Variation.select(:product_id).distinct.pluck(:product_id)
        Product.where(id: x)
    end

end

