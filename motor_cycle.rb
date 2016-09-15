class MotorCycle
	WHEEL = 2

	def initialize(name:, current_fuel:, max_capacity_fuel:, velocity:nil, time:nil, distance:nil)
		@name = name
		@current_fuel = current_fuel
		@max_capacity_fuel = max_capacity_fuel
		@velocity = 0 #can be nil for now
		@time = 0 #can be nil for now
		@distance = 0 #can be nil for now
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
			current_fuel()
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
			distance()
			time()
		end
		current_fuel()
	end

	def reset
		@current_fuel = 0
		@distance = 0
		@time = 0
		current_fuel()
		distance()
		time()
	end

	def name
		puts "Name = " + @name
	end

	def current_fuel
		puts "Current fuel = " + @current_fuel.to_s + " liters."
	end

	def max_capacity_fuel
		puts "Max capacity fuel = " + @max_capacity_fuel.to_s + " liters."
	end

	def velocity
		puts "Velocity = " + @velocity.to_s + " meter per seconds."
	end

	def time
		puts "Time = " + @time.to_s + " seconds."
	end

	def distance
		puts "Distance = " + @distance.to_s + " meters."
	end

end