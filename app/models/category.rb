class Category < ApplicationRecord
  has_and_belongs_to_many :products, dependent: :destroy

  #Self Assotiation
  has_many :subcategories, class_name: "Category", foreign_key: "category_id", dependent: :destroy
  belongs_to :category, class_name: "Category", optional: true

  validates :name, presence: true, uniqueness: true

  def children_categories
    Category.all.where(category_id: self.id)
  end

#Aplicar Recursividad 
  def self.show_categories
    categories_hash = {}
    Category.all.where(category_id: nil).each do |parent|
      categories_hash[ parent.name.to_sym ] = parent.children_categories
    end
    categories_hash
  end

end