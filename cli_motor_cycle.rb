# motor_cycle.rb
require_relative 'motor_cycle'
require 'pry'

#CLI Submenu
def refill(a)
	puts "*1. Refill Fuel*"
	print "Refill (in litres): "
	fuel_input = gets.chomp.to_i
	a.refill(fuel_input)	
	puts "END-OF-REFILL"
end

def ride(a)
	puts "*2. Ride MotorCycle*"
	print "Time (in seconds): "
	time_input = gets.chomp.to_i
	x = a.velocity
	a.ride(time_input,x)
	puts "END-OF-RIDE"
end

def reset(a)
	puts "*3. Reset MotorCycle*"
	a.reset
	puts "Reset current_fuel, distance, and time."
	puts "END-OF-RESET"
end

def changeVel(a)
	puts "*4. Change Velocity*"
	print "Velocity: "
	vel = gets.chomp.to_i
	a.velocity = vel
	puts "END-OF-CHANGE"
end

def changeMax(a)
	puts "*5. Change Max Fuel Capacity*"
	print "Max Capacity Fuel: "
	max = gets.chomp.to_i
	a.max_capacity_fuel = max
	puts "END-OF-CHANGE"
end

def changeNam(a)
	puts "*6. Change MotorCycle Name*"
	print "Name: "
	name = gets.chomp.to_s
	a.name = name
	puts "END-OF-CHANGE"
end

def details(a)
	puts "*7. Details*"
	puts "Name: " + a.name
	puts "Max Capacity Fuel: " + a.max_capacity_fuel.to_s
	puts "Velocity: " + a.velocity.to_s
	puts "Time Travelled: " + a.time.to_s
	puts "Distance Travelled: " + a.distance.to_s
	puts "Current Fuel: " + a.current_fuel.to_s
	puts "END-OF-DETAILS"
end

##CLI MotorCycle MENU
def create
	puts "*1. CREATE NEW MOTORCYCLE*"
	print "New name: "
	new_name = gets.chomp
	print "New max capacity fuel: "
	new_max_capacity_fuel = gets.chomp.to_i
	print "Velocity: "
	new_velocity = gets.chomp.to_i
	MotorCycle.create(new_name.to_s, 0, new_max_capacity_fuel, new_velocity, 0, 0)
	puts "*END-OF-CREATE*"
end

def list
	puts "*2. LIST OF MOTORCYCLES*"
	x = MotorCycle.all
	i=0
	x.each do |bike|
		i += 1
		print i.to_s + ". "
		print bike.name.to_s
		puts
	end
	puts "*END-OF-LIST*"
end

def select
	puts "*3. SELECT A MOTORCYCLE*"

	x = MotorCycle.all
	i = 0
	x.each do |bike|
		i += 1
		print i.to_s + ". "
		print bike.name.to_s
		puts
	end
	
	puts "*END-OF-LIST*"
	print "Select bike: "
	select_bike = gets.chomp.to_i
	a = x[i-1]
	puts "MotorCycle -- " + a.name
	
	exit = false
	while !exit
		puts "***SUBMENU***"
		puts "1. Refill Fuel"
		puts "2. Ride MotorCycle"
		puts "3. Reset MotorCycle"
		puts "4. Change Velocity"
		puts "5. Change Max Fuel Capacity"
		puts "6. Change MotorCycle Name"
		puts "7. Details"
		puts "8. Exit"
		print "Choose your option: "
		answer = gets.chomp
		answer = answer.to_i
		case answer
		when 1
			refill(a)
		when 2
			ride(a)
		when 3
			reset(a)
		when 4
			changeVel(a)
		when 5
			changeMax(a)
		when 6
			changeNam(a)
		when 7
			details(a)
		when 8
			exit = true	
		end
	end
	puts "*END-OF-SELECT*"
end

def destroy
	puts "*4. DESTROY A MOTORCYCLE*"

	x = MotorCycle.all
	i=0
	x.each do |bike|
		i+=1
		print i.to_s + ". "
		print bike.name.to_s
		puts
	end
	
	puts "*END-OF-LIST*"
	select_bike = gets.chomp.to_i
	a = x[i-1]
	name = a.name
	MotorCycle.destroy(name)
	puts "*END-OF-DETROY*"
end

exit = false
puts "CLI RUBY -- MotorCycle"
begin
	puts "***MENU***"
	puts "1. Create a new MotorCycle"
	puts "2. List all MotorCycles"
	puts "3. Select one MotorCycle"
	puts "4. Destroy a MotorCycle"
	puts "5. Exit"
	print "Choose your option: "
	answer = gets.chomp
	answer = answer.to_i
	case answer
	when 1
		create()
	when 2
		list()
	when 3
		select()
	when 4
		destroy()
	when 5
		exit = true
	end
end while !exit

puts "*-END-OF-PROGRAM-*"