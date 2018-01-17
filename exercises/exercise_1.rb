require_relative '../setup'
require 'pg'

puts "Exercise 1"
puts "----------"

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: {greater_than_or_equal_to: 0, only_integer: true }
  validate :carries_an_apparel_type?

  def carries_an_apparel_type?
    if mens_apparel == nil && womens_apparel == nil
      puts errors.add(:womens_apparel, "Apparel type cannot be empty")
    end
  end
end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, presence: true
  validates :store_id, presence: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }

  before_create :make_password

  private 

    def make_password
      self.password = ('a'..'z').to_a.shuffle[0,6].join
    end

end

# Exercise 1

burnaby = Store.create(name: "Burnaby", annual_revenue: 300000, mens_apparel: true, womens_apparel: false)
richmond = Store.create(name: "Richmond", annual_revenue: 1260000, mens_apparel: false, womens_apparel: true)
gastown = Store.create(name: "Gastown", annual_revenue: 190000, mens_apparel: true, womens_apparel: false)

p "----- Exercise 1 -----"
p "----- Store count is: -----"
p Store.count


