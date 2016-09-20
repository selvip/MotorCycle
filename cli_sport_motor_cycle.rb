require_relative 'sport_motor_cycle'

#CLI Submenu
def refill(object)
	puts "*1. Refill Fuel*"
	print "Refill (in litres): "
	fuel_input = gets.chomp.to_i
	object.refill(fuel_input)
	puts "END-OF-REFILL"
end

def ride(object)
	puts "*2. Ride MotorCycle*"
	print "Time (in seconds): "
	time_input = gets.chomp.to_i
	velocity = object.velocity
	object.ride(time_input,velocity)
	puts "END-OF-RIDE"
end

def reset(object)
	puts "*3. Reset MotorCycle*"
	object.reset
	puts "Reset current_fuel, distance, and time."
	puts "END-OF-RESET"
end

def changeGear(object)
	puts "*4. Change Gear*"
	print "Forward? (y/n) : "
	yn_input = gets.chomp
	case yn_input
	when 'y'
		object.change_gear(true)
	when 'Y'
		object.change_gear(true)
	when 'n'
		object.change_gear(false)
	when 'N'
		object.change_gear(false)
	end
	puts "Current Gear = " + object.gear.to_s
end

def details(object)
	puts "*5. Details*"
	object.display_name
	object.display_max_capacity_fuel
	object.display_velocity
	object.display_time
	object.display_distance
	object.display_current_fuel
	object.display_gear
	object.display_type
	puts "END-OF-DETAILS"
end

def horn(object)
	puts "*6. Horn the MotorCycle*"
	print "SFX : "
	object.press_horn
	puts "END-OF-HORN"
end

##CLI MotorCycle MENU
def create
	puts "*1. CREATE NEW SPORTMOTORCYCLE*"
	print "New name: "
	new_name = gets.chomp
	puts "Choose type: "
	puts "1. 110"
	puts "2. 120"
	puts "3. 250"
	puts "4. 300"
	print "Option: "
	new_type = gets.chomp.to_i
	case new_type
	when 1
		new_type = 110
	when 2
		new_type = 120
	when 3
		new_type = 250
	when 4
		new_type = 300
	end
	SportMotorCycle.new(new_name.to_s, new_type)
	puts "*END-OF-CREATE*"
end

def list
	puts "*2. LIST OF MOTORCYCLES*"
	bikes = SportMotorCycle.all
	i=0
	bikes.each do |bike|
		i += 1
		print i.to_s + ". "
		print bike.name.to_s
		puts
	end
	puts "*END-OF-LIST*"
end

def select
	puts "*3. SELECT A MOTORCYCLE*"

	bikes = SportMotorCycle.all
	i = 0
	bikes.each do |bike|
		i += 1
		print i.to_s + ". "
		print bike.name.to_s
		puts
	end
	
	puts "*END-OF-LIST*"
	print "Select bike: "
	select_bike = gets.chomp.to_i
	object = bikes[i-1]
	puts "MotorCycle -- " + object.name
	
	exit = false
	while !exit
		puts "***SUBMENU***"
		puts "1. Refill Fuel"
		puts "2. Ride MotorCycle"
		puts "3. Reset MotorCycle"
		puts "4. Change Gear"
		puts "5. Details"
		puts "6. Horn the MotorCycle"
		puts "7. Exit"
		print "Choose your option: "
		answer = gets.chomp
		answer = answer.to_i
		case answer
		when 1
			refill(object)
		when 2
			ride(object)
		when 3
			reset(object)
		when 4
			changeGear(object)
		when 5
			details(object)
		when 6
			horn(object)
		when 7
			exit = true	
		end
	end
	puts "*END-OF-SELECT*"
end

def destroy
	puts "*4. DESTROY A MOTORCYCLE*"

	bikes = SportMotorCycle.all
	i=0
	bikes.each do |bike|
		i+=1
		print i.to_s + ". "
		print bike.name.to_s
		puts
	end
	
	puts "*END-OF-LIST*"
	print "Select bike : "
	select_bike = gets.chomp.to_i
	puts bikes.length
	if (select_bike-1) < bikes.length and (select_bike-1) >= 0
		selected_bike = bikes[select_bike-1]
		SportMotorCycle.destroy(selected_bike)
		puts "Object has been destroyed."
	else
		puts "Cannot find any."
	end
	puts "*END-OF-DESTROY*"
end

exit  = false
puts "CLI RUBY -- Sport Motor Cycle"
begin
	puts "***MENU***"
	puts "1. Create a new SportMotorCycle"
	puts "2. List all SportMotorCycles"
	puts "3. Select one SportMotorCycle"
	puts "4. Destroy a SportMotorCycle"
	puts "5. Exit"
	print "Choose your option: "
	answer = gets.chomp
	answer = answer.to_i
	case answer
	when 1
		create
	when 2
		list
	when 3
		select
	when 4
		destroy
	when 5
		exit = true
	end
end while !exit

puts "*-END-OF-PROGRAM-*"