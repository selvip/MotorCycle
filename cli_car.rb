require_relative 'car'
require 'pry'

#CLI Submenu
def refill(object)
	puts "*1. Refill Fuel*"
	print "Refill (in litres): "
	fuel_input = gets.chomp.to_i
	object.refill(fuel_input)
	puts "END-OF-REFILL"
end

def ride(object)
	puts "*2. Ride Car*"
	print "Time (in seconds): "
	time_input = gets.chomp.to_i
	velocity = object.velocity
	object.ride(time_input,velocity)
	puts "END-OF-RIDE"
end

def reset(object)
	puts "*3. Reset Car*"
	object.reset
	puts "Reset current_fuel, distance, and time."
	puts "END-OF-RESET"
end

def changeVel(object)
	puts "*4. Change Velocity*"
	print "Velocity: "
	velocity = gets.chomp.to_i
	object.velocity = velocity
	puts "END-OF-CHANGE"
end

def changeMax(object)
	puts "*5. Change Max Fuel Capacity*"
	print "Max Capacity Fuel: "
	max_fuel = gets.chomp.to_i
	if max_fuel < object.current_fuel
		puts "Max fuel must not be less than current fuel. Current fuel: " + object.current_fuel.to_s
	else
		object.max_capacity_fuel = max_fuel
	end
	puts "END-OF-CHANGE"
end

def changeNam(object)
	puts "*6. Change Car Name*"
	print "Name: "
	name = gets.chomp.to_s
	object.name = name
	puts "END-OF-CHANGE"
end

def details(object)
	puts "*7. Details*"
	object.display_name
	object.display_max_capacity_fuel
	object.display_velocity
	object.display_time
	object.display_distance
	object.display_current_fuel
	puts "END-OF-DETAILS"
end

def horn(object)
	puts "*8. Horn*"
	print "SFX : "
	object.press_horn
	puts "END-OF-HORN"
end

##CLI Car MENU
def create
	puts "*1. CREATE NEW CAR*"
	print "New name: "
	new_name = gets.chomp.to_s
	print "New max capacity fuel: "
	new_max_capacity_fuel = gets.chomp.to_i
	print "Velocity: "
	new_velocity = gets.chomp.to_i
	Car.create(new_name, 0, new_max_capacity_fuel, new_velocity, 0, 0)
	puts "*END-OF-CREATE*"
end

def list
	puts "*2. LIST OF CARS*"
	list_of_cars = Car.all
	i = 0
	list_of_cars.each do |car|
		i += 1
		print i.to_s + ". "
		print car.name.to_s
		puts
	end
	puts "*END-OF-LIST*"
end

def select
	puts "*3. SELECT A Car*"

	cars = Car.all
	i = 0
	cars.each do |car|
		i += 1
		print i.to_s + ". "
		print car.name.to_s
		puts
	end
	
	puts "*END-OF-LIST*"
	print "Select car: "
	select_car = gets.chomp.to_i
	if (select_car-1) < cars.length and (select_car-1) >= 0
		object = cars[i-1]
		puts "Car -- " + object.name
		
		exit = false
		while !exit
			puts "***SUBMENU***"
			puts "1. Refill Fuel"
			puts "2. Ride Car"
			puts "3. Reset Car"
			puts "4. Change Velocity"
			puts "5. Change Max Fuel Capacity"
			puts "6. Change Car Name"
			puts "7. Details"
			puts "8. Horn the car"
			puts "9. Exit"
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
				changeVel(object)
			when 5
				changeMax(object)
			when 6
				changeNam(object)
			when 7
				details(object)
			when 8
				horn(object)
			when 9
				exit = true	
			end
		end
	else
		puts "Unable to retrieve."
	end
	puts "*END-OF-SELECT*"
end

def destroy
	puts "*4. DESTROY A CAR*"

	cars = Car.all
	i=0
	cars.each do |car|
		i+=1
		print i.to_s + ". "
		print car.name.to_s
		puts
	end
	
	puts "*END-OF-LIST*"
	print "Select car : "
	select_car = gets.chomp.to_i
	if (select_car-1) < cars.length and (select_car-1) >= 0
		selected_car = cars[select_car-1]
		Car.destroy(selected_car)
		puts "Object has been destroyed."
	else
		puts "Cannot find any."
	end
	puts "*END-OF-DESTROY*"
end

exit = false
puts "CLI RUBY -- CAR"
begin
	puts "***MENU***"
	puts "1. Create a new car."
	puts "2. List all cars"
	puts "3. Select one car"
	puts "4. Destroy a car"
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