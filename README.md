#### E-COMMERCE PROJECT

1. [ERD here](../tree/db-redef/erd.pdf)

2. Category nested levels are implemented with a self-join, also the Category model has an uniqueness validation to ensure no category is the same, therefore no category has the same parent.
to run the test use `rspec spec/models/category_spec.rb`

[Test can be found here](..tree/db-redef/spec/models/category_spec.rb)

3. Method `all_children` generates the whole category list in a nested hash. It can be found in the [Category model](..tree/db-redef/app/models/category.rb)

4. The catalog is implemented by using the `Product` & `ProductVariation` models. The `ProductVariation` contains all info about stocks, prices and SKUs

```ruby
@ids_available = ProductVariation.where.not(stock: 0).select(:product_id).distinct.pluck(:product_id)
```

by getting the ids of the products with stock we retrieve only info of the products we actually have

```ruby
@products = Product.find(@ids_available)
```

..* The index view keeps the same structure, only minor visual details were added like a number field for the quantity & the link bottom to the show view.

..* The show view needs to first select the variation avaible through the select field, after clicking the search button, the form will refresh the page and update all the fields with the info of the current variation.

..* After the variation its selected you will be able to buy the item

5. Because ProductVariation summarize all the details of a variations, because affects the total price of a product now is:

###### Total Price = product.price + variation.added_price

in order to achieve this calculation, its necesary that variation_id, be added to the [CartController](..tree/db-redef/app/controllers/carts_controller.rb) & [Order](..tree/db-redef/app/models/order.rb) model, and every element related to the cart process.

7. 