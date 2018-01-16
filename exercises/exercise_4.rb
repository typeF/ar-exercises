require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

surrey = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
whistler = Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
yaletown = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

@mens_stores = Store.where(mens_apparel: true)
@mens_stores = Store.where("mens_apparel = ?", true)

p "----- Exercise 4 -----"

p "----- Men's Stores: -----"
@mens_stores.each do |store|
  p store.name
  p store.annual_revenue
end

@womens_stores = Store.where("womens_apparel = ? AND annual_revenue < ?", true, 1000000)

p "----- Women's Stores: -----"
@womens_stores.each do |store|
  p store.name
  p store.annual_revenue
end
