puts "Item Attribute Table"

puts "Cleaning"
ItemAttribute.delete_all

att_default = {
    color: ["White", "Black", "Red", "Green", "Blue", "Yellow", "Orange", "Purple", "Magenta", "Cyan"],
    size: ["XS", "S", "M", "L", "XL"]
}

print "Seeding"
att_default.each do |k, v|
    v.each do |arr|
        ItemAttribute.create!(name: k, value: arr)
        print "."
    end
end
puts ""