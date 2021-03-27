class Size < ApplicationRecord
   has_many :variations#, dependent: :destroy
end
