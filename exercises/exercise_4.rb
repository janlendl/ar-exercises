require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
store = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)

store = Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)

store = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

@mens_stores = Store.where(mens_apparel: true, womens_apparel: false)

puts "Men's store"
@mens_stores.each do |ms|
  puts "Name: #{ms.name}"
  puts "Annual Revenue: #{ms.annual_revenue}"
end

@womens_stores = Store.where(mens_apparel: false, womens_apparel: true).where("annual_revenue < ?", 1000000)


puts "Women's store"
@womens_stores.each do |ws|
  puts "Name: #{ws.name}"
  puts "Annual Revenue: #{ws.annual_revenue}"
end