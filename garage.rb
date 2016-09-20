require_relative 'motor_cycle'
class Garage

	require 'pry'

	attr_accessor :motors

  def initialize(motors)
  	@motors = motors
  end
 
  def add_to_garage(motor)
  	@motors.insert(@motors.length, motor)
  	puts "Motor added to garage #{motor.name}"
  end

  def find_in_garage(index)
  	@motors.find{ |motor| motor.name == index}
  end

  def remove_from_garage(motor)
  	@motors.delete_if{ |bike| bike == motor}
  end

  def display_motors
  	@motors.each_with_index do |motor,index|
			index += 1
			puts "#{index}. #{motor.name}"
		end
  end

end