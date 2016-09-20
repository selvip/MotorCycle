require_relative 'motor_cycle'

class SportMotorCycle < MotorCycle

	attr_accessor :gear, :type

	def initialize(name, type)
		@name = name
		@type = type
		@gear = 1
		@current_fuel = 0
		@time = 0
		@distance = 0
		setter(type)
		@@bikes.insert(@@bikes.length,self)
		puts "A SportMotorCycle has been added"
	end

	def display_type
		puts "Type: " + @type.to_s
	end

	def display_gear
		puts "Gear: " + @gear.to_s
	end

	def velocity_mps
		@velocity = @velocity * 3.6
	end

	def display_velocity
		velocity = @velocity / 3.6
		puts "Velocity: " + velocity.to_s + " kilometer per hours."
	end

	def display_distance
		distance = @distance * 0.001
		puts "Distance: " + distance.to_s + " kilometers."
	end

	def display_time
		time = @time * 0.00027777777
		puts "Time: " + time.to_s + " hours."
	end
require 'pry'
	def setter(type)
		case type
		when 110
			@type = 110
			@velocity = 20
			@max_capacity_fuel = 11
		when 120
			@type = 120
			@velocity = 40
			@max_capacity_fuel = 12
		when 250
			@type = 250
			@velocity = 60
			@max_capacity_fuel = 25
		when 300
			@type = 300
			@velocity = 70
			@max_capacity_fuel = 30
		else
			puts 'type not include in list'
		end
		velocity_mps
	end

	def increase_gear
		if @type < 150
			if gear < 4
				@gear += 1
				@velocity += 5 * 3.6
			else
				puts "Max gear = 4."
			end				
		elsif @type > 150
			if gear < 5
				@gear += 1
				@velocity += 5 *3.6
			else
				puts "Max gear = 5."
			end
		end
		
	end

	def decrease_gear
		if @gear > 1
			@gear -= 1
			@velocity -= 5 * 3.6
		else
			puts "Min gear = 1."
		end
	end

	def change_gear(forward)
		if forward == true
			increase_gear()
		else
			decrease_gear()
		end
	end

end