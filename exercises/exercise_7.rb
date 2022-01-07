require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee
  validates :first_name, :last_name, :store, presence: true
  validates :hourly_rate, numericality: { in: 40..200 }
end

class Store
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :apparel_check


  def apparel_check
    if mens_apparel == false && womens_apparel == false
      errors.add(:store, "The store must carry at least one type of apparel")
    end
  end
end

puts "Enter store name: "
store_name = gets.chomp

store = Store.create(name: store_name, annual_revenue: 10000, mens_apparel: false, womens_apparel: false)

puts store.errors.full_messages
