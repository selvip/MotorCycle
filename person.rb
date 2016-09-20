require_relative 'garage'
class Person
  attr_accessor :name

  def initialize(name:)
    @name = name
    @garage = Garage.new([])
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