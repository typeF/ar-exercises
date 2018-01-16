require_relative '../setup'
require 'pg'

puts "Exercise 1"
puts "----------"

class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end
# Exercise 1

burnaby = Store.create(name: "Burnaby", annual_revenue: 300000, mens_apparel: true, womens_apparel: false)
richmond = Store.create(name: "Richmond", annual_revenue: 1260000, mens_apparel: false, womens_apparel: true)
gastown = Store.create(name: "Gastown", annual_revenue: 190000, mens_apparel: true, womens_apparel: false)

# p "----- Exercise 1 -----"
# p "----- Store count is: -----"
# p Store.count

# Exercise 2

@store1 = Store.find(1)
@store2 = Store.find(2)

@store1.name = "Vancouver"
@store1.save

p "----- Exercise 2 -----"
p "----- Store count is: -----"
puts Store.count

# # Exercise 3

@store3 = Store.find(3)
@store3.destroy

p "----- Exercise 3 -----"
p "----- Store count is: -----"
p Store.count #Should have 3

# # Exercise 4 - Loading a subset of stores

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

# Exercise 5 - Calculations

p "----- Total revenue for all stores -----"
total_revenue = Store.sum(:annual_revenue)
p total_revenue

p "----- Average revenue for all stores -----"
num_stores = Store.count
avg_revenue = (total_revenue / num_stores)
p avg_revenue

p "----- Number of stores with annual sales > $1M -----"
num_high_sales_stores =  Store.where("annual_revenue > ?", 1000000).count
p num_high_sales_stores

# Exercise 6 - One-to-many association

@store1.employees.create(first_name: "John", last_name: "Smith", hourly_rate: 11)
@store1.employees.create(first_name: "Jane", last_name: "doe", hourly_rate: 22)

@store2.employees.create(first_name: "Adam1", last_name: "Ju", hourly_rate: 33)
@store2.employees.create(first_name: "Aaron2", last_name: "Bu", hourly_rate: 44)
@store2.employees.create(first_name: "Arby3", last_name: "Fu", hourly_rate: 55)


# Exercise 7 - Validations for both models

