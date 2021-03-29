print "Category Table"

print " => Cleaning"
Category.delete_all

category_default = {
    Smartphones: ["Cellphone", "FlatScreen", "Foldeable", "Old-one"],
    Shoes: ["Sport", "Casual", "Formal", "Dacing", "Boots"],
    Accesories: ["Ring", "Collar", "Earrings", "Watches", "Piercing"]
}

print " => Seeding"
category_default.each do |k, v|
    cat_temp = Category.create!(name: k)
    v.each do |arr|
        Category.create!(name: arr, category_id: cat_temp.id)
        print "."
    end
end
puts ""
