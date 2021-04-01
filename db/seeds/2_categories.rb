print "Category Table"

print " => Cleaning"
Category.delete_all

category_default = {
    Smartphones: {
        Cellphone: ["Nokia", "Asus"],
        FlatScreen: ["Iphone", "Xiaomi", "Google"],
        Foldeable: [],
        Old_one: []
    },

    Shoes: {
        Sport: ["Nike", "Addidas"],
        Casual: ["Clarks"],
        Formal: ["Stevanely", "Mocasino"],
        Dacing: [],
        Boots: []
    },

    Accesories: {
        Ring: ["Ringtone", "TheRing"],
        Collar: [],
        Earrings: ["Tiffany"],
        Watches: ["Seiko", "Casio"],
        Piercing: []
    }
}

print " => Seeding"
category_default.each do |k, v|
    cat_temp = Category.create!(name: k)
    v.each do |k1, v1|
        cat_temp1 = Category.create!(name: k1, category_id: cat_temp.id)
        v1.each do |arr|
            Category.create!(name: arr, category_id: cat_temp1.id)
            print "."
        end
    end
end
puts ""