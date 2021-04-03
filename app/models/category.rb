class Category < ApplicationRecord
  has_and_belongs_to_many :products, dependent: :destroy

  #Self Assotiation
  has_many :subcategories, class_name: "Category", foreign_key: "category_id", dependent: :destroy
  belongs_to :category, class_name: "Category", optional: true

  validates :name, presence: true, uniqueness: true

  #Retrieves a hierarchical list of categories
  #Test it in rails console
  def self.all_children(parent_id = nil)
    categories_hash = Hash.new()

    Category.all.where(category_id: parent_id).each do |parent|
      categories_hash[ parent.name.to_sym ] = Hash.new()

      childrens = parent.subcategories

      unless childrens.empty?
        childrens.each do |child|
          categories_hash[ parent.name.to_sym ][ child.name.to_sym ] = Hash.new()

          unless child.subcategories.empty?
            categories_hash[ parent.name.to_sym ][ child.name.to_sym ] = Category.all_children(child.id)
          end

        end
      end
      
    end

    categories_hash
  end

end

