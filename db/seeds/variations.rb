Variation.delete_all

puts "Seed Variations"

products = Product.all
sizes = Size.all
colors = Color.all

products.each do |product|
    sizes.each do |size|
        colors.each do |color|
            Variation.create!(product: product, size: size, color: color, stock: rand(1..10))
        end
    end
end