
class MotorCycle
	WHEEL = 2
	@@bikes = []

require 'pry'

	def initialize(name, current_fuel, max_capacity_fuel)
		@name = name
		@current_fuel = current_fuel
		@max_capacity_fuel = max_capacity_fuel
		@velocity = 0 #can be nil for now
		@time = 0 #can be nil for now
		@distance = 0 #can be nil for now
		@@bikes.insert(@@bikes.length,self)
		puts "Object has been added."
	end

	def refill(fill)
		if @current_fuel < @max_capacity_fuel #kalo bisa diisi
			@current_fuel = @current_fuel + fill
			if @current_fuel > @max_capacity_fuel
				@current_fuel = @max_capacity_fuel
				puts "Cannot be filled anymore"
			end
		else #ga bisa diisi
			puts "Cannot be filled anymore"
		end
			display_current_fuel()
	end

	def ride(time1, velocity)
		@velocity = velocity
		if @current_fuel <= 0
			puts "Cannot run the MotorCycle anymore"
		else
			dist = time1 * @velocity
			fuel_needed = dist * 0.01
			if fuel_needed >= @current_fuel
				time2 = @current_fuel * 100 / @velocity
				@current_fuel = 0
				dist1 = time2 * @velocity
				@distance = @distance + dist1
				@time = @time + time2
				puts "Fuel empty."
				puts "Current distance = " + dist.to_s + " meters."
				puts "Current duration = " + time2.to_s + " seconds. "
			else # @current_fuel > fuel_needed
				@distance = @distance + dist
				@time = @time + time1
				@current_fuel = @current_fuel - fuel_needed
				puts "Stopped."
				puts "Current distance = " + dist.to_s + " meters."
				puts "Current duration = " + time1.to_s + " seconds. "
			end
			display_distance()
			display_time()
		end
		display_current_fuel()
	end

	def reset
		@current_fuel = 0
		@distance = 0
		@time = 0
		display_current_fuel()
		display_distance()
		display_time()
	end

	def display_name
		puts "Name = " + @name
	end

	def name
		@name
	end

	def display_current_fuel
		puts "Current fuel = " + @current_fuel.to_s + " liters."
	end

	def current_fuel
		@current_fuel
	end

	def display_max_capacity_fuel
		puts "Max capacity fuel = " + @max_capacity_fuel.to_s + " liters."
	end

	def max_capacity_fuel
		@max_capacity_fuel
	end

	def display_velocity
		puts "Velocity = " + @velocity.to_s + " meter per seconds."
	end

	def velocity
		@velocity
	end

	def display_time
		puts "Time = " + @time.to_s + " seconds."
	end

	def time
		@time
	end

	def display_distance
		puts "Distance = " + @distance.to_s + " meters."
	end

	def distance
		@distance
	end

	def self.find(id)
		@@bikes.select{ |bike| bike.name == id}
	end

	def self.all
		puts @@bikes.length
		@@bikes.each do |bike|
			print bike.name + ", "
		end
		puts
	end

	def self.destroy(id)
		@@bikes.delete_if{ |bike| bike.name == id}
		puts "The object has been removed."
	end
end