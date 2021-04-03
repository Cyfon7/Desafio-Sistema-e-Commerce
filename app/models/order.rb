class Order < ApplicationRecord
  before_create -> { generate_number(hash_size) }

  belongs_to :user

  has_many :order_items                    #This dependent affect the Order Table to be accessed           
  has_many :products, through: :order_items#, dependent: destroy
  has_many :payments, dependent: :destroy

  validates :number, uniqueness: true

  def generate_number(size)
    self.number ||= loop do
      random = random_candidate(size)
      break random unless self.class.exists?(number: random)
    end
  end

  def random_candidate(size)
    "#{hash_prefix}#{Array.new(size){rand(size)}.join}"
  end

  def hash_prefix
    "BO"
  end

  def hash_size
    9
  end

  #variation data added
  def add_product(product_id, quantity, variation_id)
    product = Product.find(product_id)
    #new
    variation = ProductVariation.where(variation_id: variation_id)
    
    #variation added
    if product && (variation[0].stock > 0)
      order_items.create(product_id: product.id, quantity: quantity, variation_id: variation_id, price: (product.price + variation[0].added_price))
      compute_total
    end
  end

=begin
  #proposal for coupon
  def apply_coupon
    current_order = Order.find(params[:id])
    coupon = Coupon.where(code: params[:code])
    if coupon.discount == :percentage
        order_items.create(quantity: 1, price: -(current_order.total * coupon.amount) )
    else
        order_items.create(quantity: 1, price: coupon.amount)
    end
    compute_total
  end
=end

  def compute_total
    sum = 0
    order_items.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end
end
