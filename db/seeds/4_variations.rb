print "Variation Table"

print " => Cleaning"
Variation.delete_all

att_default = {
    color: ["White", "Black", "Red", "Green", "Blue", "Yellow", "Orange", "Purple", "Magenta", "Cyan"],
    size: ["XS", "S", "M", "L", "XL"]
}

print " => Seeding"

att_default[:size].each do |val|
    temp_att = Variation.create!(name: :size, value: val)
    att_default[:color].each do |val2|
        Variation.create!(name: :color, value: val2, variation_id: temp_att.id)
    end
    print "."
end
puts ""