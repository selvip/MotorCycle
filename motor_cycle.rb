require_relative 'horn'
class MotorCycle
	include Horn
	WHEEL = 2
	@@bikes = []

	require 'pry'

	attr_accessor :name, :current_fuel, :max_capacity_fuel, :velocity, :time, :distance, :space, :price

	def initialize(name:, current_fuel:, max_capacity_fuel:, velocity:, time:, distance:, space: nil, price: nil)
		@name = name
		@current_fuel = current_fuel
		@max_capacity_fuel = max_capacity_fuel
		@velocity = velocity
		@time = time
		@distance = distance
		@space = space
		@price = price
		@@bikes.insert(@@bikes.length,self)
	end

	def refill(fill)
		if @current_fuel < @max_capacity_fuel
			@current_fuel = @current_fuel + fill
			if @current_fuel > @max_capacity_fuel
				@current_fuel = @max_capacity_fuel
				puts "Cannot be filled anymore"
			end
		else
			puts "Cannot be filled anymore"
		end
			display_current_fuel
	end

	def ride(time1, velocity)
		@velocity = velocity
		if @current_fuel <= 0
			puts "Cannot run the MotorCycle"
		else
			dist = time1 * @velocity
			fuel_needed = dist * 0.01
			if fuel_needed >= @current_fuel
				time2 = @current_fuel * 100 / @velocity
				@current_fuel = 0
				dist1 = time2 * @velocity
				@distance = @distance + dist1
				@time = @time + time2
			else 
				@distance = @distance + dist
				@time = @time + time1
				@current_fuel = @current_fuel - fuel_needed
			end
			display_distance
			display_time
		end
		display_current_fuel
	end

	def reset
		@current_fuel = 0
		@distance = 0
		@time = 0
		display_current_fuel
		display_distance
		display_time
	end

	def max_time_ride
		
		time = @current_fuel * 100 / @velocity

	end


	def display_name
		puts "Name = " + @name
	end

	def display_current_fuel
		puts "Current fuel = " + @current_fuel.to_s + " liters."
	end

	def display_max_capacity_fuel
		puts "Max capacity fuel = " + @max_capacity_fuel.to_s + " liters."
	end

	def display_velocity
		puts "Velocity = " + @velocity.to_s + " meter per seconds."
	end

	def display_time
		puts "Time = " + @time.to_s + " seconds."
	end

	def display_distance
		puts "Distance = " + @distance.to_s + " meters."
	end

	def self.find(id)
		@@bikes.find{ |bike| bike.name == id}
	end

	def self.all
		@@bikes
	end

	def self.destroy(id)
		@@bikes.delete_if{ |bike| bike == id}	
	end

	def self.create(name, current_fuel, max_capacity_fuel, velocity, time, distance, space)
		self.new(name, current_fuel, max_capacity_fuel, velocity, time, distance, space)
	end

end