require_relative 'garage'
class Person
  attr_accessor :name, :garage_space

  def initialize(name:, garage_space:)
    @name = name
    @garage = Garage.new([], garage_space)
  end

  def all_motors
    @garage.motors
  end

  def add_motor(motor)
    next_space = @garage.free_capacity - motor.space
    if next_space < 0
      puts "Full. Unable to store."
    else
      @garage.add_to_garage(motor)
    end
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