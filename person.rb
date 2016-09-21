require_relative 'garage'
class Person
  attr_accessor :name, :money_left
  attr_writer :garage_space

  def initialize(name:, garage_space:, money:)
    @name = name
    @money = money
    @money_left = @money
    @garage = Garage.new([], garage_space)
  end

  def garage_current_capacity
    @garage.free_capacity
  end

  def garage_current_capacity=(garage_current_capacity)
    garage_current_capacity
  end

  def all_motors
    @garage.motors
  end

  def add_motor(motor)
    @garage.add_to_garage(motor)
  end

  def find_motor(index)
    @garage.find(index)
  end

  def remove_motor(motor)
    @garage.remove_from_garage(motor)
  end

  def display_garage
    @garage.display_motors
  end

end