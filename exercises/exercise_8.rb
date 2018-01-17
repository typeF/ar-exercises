require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'

puts "Exercise 8"
puts "----------"
# p @store3
p @store2.employees.create!(first_name: "Aritor", last_name: "Pom", hourly_rate: 50)

# p blub
