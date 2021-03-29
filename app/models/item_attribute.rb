class ItemAttribute < ApplicationRecord
    has_and_belongs_to_many :variations, dependent: :destroy

end