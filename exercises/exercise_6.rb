require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

@store1.employees.create!(first_name: "John", last_name: "Smith", hourly_rate: 50)
@store1.employees.create!(first_name: "Jane", last_name: "doe", hourly_rate: 50)

@store2.employees.create!(first_name: "Adam1", last_name: "Ju", hourly_rate: 50)
@store2.employees.create!(first_name: "Aaron2", last_name: "Bu", hourly_rate: 50)
@store2.employees.create!(first_name: "Arby3", last_name: "Fu", hourly_rate: 50)

