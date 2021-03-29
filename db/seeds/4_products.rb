print "Product Table"

print " => Cleaning"
Product.delete_all

print " => Seeding"

category_1 = Category.find_by(name: "Smartphones")

p_01 = Product.create!(name: "iPhone XS", description: "Super retina screen", price: 900)
p_01.categories << category_1
print "."

p_02 = Product.create!(name: "Xiaomi Mi Mix 3", description: "Borderless, powerful, super camera", price: 400)
p_02.categories << category_1
print "."

p_03 = Product.create!(name: "Xiaomi Pocophone", description: "The best phone for millenials", price: 300)
p_03.categories << category_1
print "."

p_04 = Product.create!(name: "Samsung S10", description: "Beautiful, elegant, powerful phone", price: 900)
p_04.categories << category_1
print "."

category_2 = Category.find_by(name: "Shoes")

p_05 = Product.create!(name: "Zico Beach Sandal", description: "The best sandal ever", price: 5)
p_05.categories << category_2
print "."

p_06 = Product.create!(name: "Adidas Superstart", description: "The old school sneakers", price: 60)
p_06.categories << category_2
print "."

p_07 = Product.create!(name: "Timberland Premium", description: "The classic yellow boots", price: 100)
p_07.categories << category_2
print "."

category_3 = Category.find_by(name: "Accesories")

p_08 = Product.create!(name: "Men Wallet", description: "Waterproof leather wallet", price: 20)
p_08.categories << category_3
print "."

p_09 = Product.create!(name: "Keychain", description: "Keep your keys together. Safe.", price: 2)
p_09.categories << category_3
print "."

p_10 = Product.create!(name: "Casio L12 Watch", description: "Never be late again, arrive on time", price: 50)
p_10.categories << category_3
print "."
puts ""
