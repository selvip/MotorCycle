require_relative 'motor_cycle'
class Garage

	require 'pry'

	attr_accessor :motors, :free_capacity

  def initialize(motors, max_capacity)
  	@motors = motors
  	@max_capacity = max_capacity
  	@free_capacity = @max_capacity
  end
 
  def add_to_garage(motor)
  	@motors << motor
  	@free_capacity = @free_capacity - motor.space
  end

  def find_in_garage(index)
  	@motors.find{ |motor| motor.name == index}
  end

  def remove_from_garage(motor)
  	@motors.delete_if{ |bike| bike == motor}
  	@free_capacity = @free_capacity + motor.space
  end

  def display_motors
  	@motors.each_with_index do |motor,index|
			index += 1
			puts "#{index}. #{motor.name}"
		end
  end

end