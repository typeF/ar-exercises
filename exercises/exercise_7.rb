require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"
p @store1.employees.create!(first_name: "Arb", last_name: "Bu", hourly_rate: 50)

puts "Input the store name: "
@store_name = gets.chomp
newStore = Store.create(name: "#{@store_name}", mens_apparel: true, womens_apparel: true)
newStore.errors.full_messages.each do |message|
  puts "Error: #{message}"
end

