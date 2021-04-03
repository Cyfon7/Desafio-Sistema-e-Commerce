### E-COMMERCE PROJECT

1. [ERD here](/erd_ecommerce.pdf)

2. Category nested levels are implemented with a self-join, also the Category model has an uniqueness validation to ensure no category is the same, therefore no category has the same parent.
to run the test use:

- `rspec spec/models/category_spec.rb`

- [Test can be found here](/spec/models/category_spec.rb)

3. Method `all_children` generates the whole category list in a nested hash. It can be found in the [Category model](/app/models/category.rb)

4. The catalog is implemented by using the `Product` & `ProductVariation` models. The `ProductVariation` contains all info about stocks, prices and SKUs

```ruby
@ids_available = ProductVariation.where.not(stock: 0).select(:product_id).distinct.pluck(:product_id)
```

By getting the ids of the products with stock, we retrieve only info of the products we actually have

```ruby
@products = Product.find(@ids_available)
```

- The index view keeps the same structure, only minor visual details were added like a number field for the quantity & the link bottom to the show view.

- The show view needs to first select the variation avaible through the select field, after clicking the search button, the form will refresh the page and update all the fields with the info of the current variation.

- After the variation its selected you will be able to buy the item

#### Management
| Dashboards url |  |
| --- | --- |
| ../products | Create Products with nested attributes |
| ../variations | Create Variations with nested options |
| ../options | Create options |


5. Because ProductVariation summarize all the details of a variations, because affects the total price of a product now is:

###### Total Price = product.price + variation.added_price

In order to achieve this calculation, its necesary that variation_id, be added to the [CartController](/app/controllers/carts_controller.rb) & [Order](/app/models/order.rb) model, and every element related to the cart process.

- [Here ERD with added modifications](/erd_ecommerce_OrderItem.pdf)


7. For the coupons feature, the proposal here is a design which work for both types of coupons:
The coupon must contain:

| Field | Description |
| --- | --- |
| **Title:** | Name of the coupon |
| **Conditions:** | A description of the coupon |
| **Discount:** | Two enum type options (Percentage or Fixed) |
| **Amount:** | The meaning depends of Discount value. When its percentage, internally it should be saved like e. for Discount 70%, amount must be 0.7 |
| **Remaining_uses:** | How many times the coupon can be used |
| **Code:** | A Predefined or random string to claim the coupon |
| **Expires_at:** | Date of expiration. If `nil` then never expires |
| **User_Authorized:** | Defines by user email who can claim the coupon. If `nil` then is public |

- In Order model it should be a method that includes the coupon like an item, but the price is negative, so the discount can be applied

```ruby
  def apply_coupon
    current_order = Order.find(params[:id])
    coupon = Coupon.where(code: params[:code])
    if coupon.discount == :percentage
        order_items.create(quantity: 1, price: -(current_order.total * coupon.amount) )
    else
        order_items.create(quantity: 1, price: -coupon.amount)
    end
    compute_total
  end
```
- [Here ERD Coupons](/erd_coupons.pdf)

##### Schema of Coupons
```ruby
  create_table "coupons", force: :cascade do |t|
    t.string "title"
    t.text "conditions"
    t.integer "discount"
    t.float "amount"
    t.string "remaining_uses"
    t.string "code"
    t.date "expires_at"
    t.string "user_authorized"
  end
```

##### User Model
```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy

  has_many :user_coupons
  has_many :coupons, through: :user_coupons
end
```

##### Coupon Model
```ruby
class Coupon < ApplicationRecord
    has_many :user_coupons
    has_many :users, through: :user_coupons
end
```

##### UserCoupon Model
```ruby
class UserCoupon < ApplicationRecord
    belongs_to :user
    belongs_to :coupon
end
```