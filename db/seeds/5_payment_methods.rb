print "PaymentMethod Table"

print " => Cleaning"
PaymentMethod.delete_all

print " => Seeding"
PaymentMethod.create!(name: "Paypal Express Checkout", code: "PEC")

puts ""