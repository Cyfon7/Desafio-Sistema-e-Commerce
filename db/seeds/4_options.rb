print "Option Table"

print " => Cleaning"


Option.delete_all
Variation.delete_all

att_default = {
    color: ["White", "Black", "Red", "Green", "Blue", "Yellow", "Orange", "Purple", "Magenta", "Cyan"],
    size: ["XS", "S", "M", "L", "XL"]
}

print " => Seeding"

#independent variation
att_default.each do |k, v|
    v.each do |val|
        Option.create!(name: k, value: val)
    end
    print "."
end

#nested variation
=begin
att_default[:size].each do |val|
    temp_att = Option.create!(name: :size, value: val)
    att_default[:color].each do |val2|
        Option.create!(name: :color, value: val2, variation_id: temp_att.id)
    end
    print "."
end
=end
puts ""