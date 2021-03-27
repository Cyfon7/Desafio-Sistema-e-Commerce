class Color < ApplicationRecord
    has_many :variations#, dependent: :destroy
end
