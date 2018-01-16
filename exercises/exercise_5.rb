require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

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
