class Variation < ApplicationRecord
    has_many :colors
    has_many :sizes
    belongs_to :product
end
