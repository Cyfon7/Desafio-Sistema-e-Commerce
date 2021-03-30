class Option < ApplicationRecord
    #has_many :variations

    #has_and_belongs_to_many :variations, dependent: :destroy
    has_many :variation_options
    has_many :variations, through: :variation_options, dependent: :destroy

end