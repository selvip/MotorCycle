require_relative 'person'

@people = []

def create_motor(name, velocity, max_fuel, space, price)
	MotorCycle.new( name: name, 
									current_fuel: 0, 
									max_capacity_fuel: max_fuel, 
									velocity: velocity, 
									time: 0, 
									distance: 0, 
									space: space,
									price: price)
end

def display_all_details(selected_motor)
	selected_motor.display_name
	selected_motor.display_current_fuel
	selected_motor.display_max_capacity_fuel
	selected_motor.display_velocity
	selected_motor.display_distance
	selected_motor.display_time
end

def pricelist(motor, index)
	puts "#{index}\t#{motor.name}\t\t#{motor.velocity}\t#{motor.space}\t#{motor.price}"
end

#SUBMENUS

def buy_motor(selected_person)
	puts "List of buyable motorcycles"
	puts "No.\tName\t\tVelocity\tSpace\tPrice"

	motor1 = create_motor('Yamaha Mio', 2, 15.0, 10, 1550)
	pricelist(motor1, 1)
	motor2 = create_motor('Honda Blade', 2, 17.0, 15, 1650)
	pricelist(motor2, 2)
	motor3 = create_motor('Honda Revo', 2, 18.0, 15, 1500)
	pricelist(motor3, 3)
	motor4 = create_motor('Kawasaki X', 5, 25.0, 25, 1850)
	pricelist(motor4, 4)
	motor5 = create_motor('Motor Rossi', 5, 25.0, 25, 2150)
	pricelist(motor5, 5)

	print "Select the motorcyle : "
	select_motor = gets.chomp.to_i
	if select_motor > 5 or select_motor < 1
		puts "Out of bound option."
	else
		case select_motor
		when 1
			selected_motor = motor1
		when 2
			selected_motor = motor2
		when 3
			selected_motor = motor3
		when 4
			selected_motor = motor4
		when 5
			selected_motor = motor5
		end
		next_space = selected_person.garage_current_capacity - selected_motor.space
		if next_space < 0
			puts "Not enough space."
		else
			next_money = selected_person.money - selected_motor.price
			if next_money < 0
				puts "Unable to afford the motorcyle."
			else
				selected_person.decrease_money(selected_motor.price)
				selected_person.add_motor(selected_motor)
				puts "#{selected_person.name} has bought #{selected_motor.name}."
			end
		end
	end
end

def list_motors(selected_person)
	puts "List of motorcyles in garage"
	selected_person.display_garage
	puts "END-OF-MOTORLIST"
end

def sell_motor(selected_person)
	puts "Sell a motorcycle"
	list_motors(selected_person)
	print "Select a motorcyle : "
	select_motor = gets.chomp.to_i
	if (select_motor-1) < 0 or (select_motor-1) >= selected_person.all_motors.length
		puts "Input is not in the list"
	else
		selected_motor = selected_person.all_motors[select_motor-1]
		selected_person.garage_current_capacity = selected_person.garage_current_capacity + selected_motor.space
		selected_person.increase_money(selected_motor.price * 0.5)
		selected_person.remove_motor(selected_motor)
		puts "#{selected_motor.name} has been removed from the list."
	end
	puts "END-OF-REMOVE"
end

def select_motor(selected_person)
	puts "Select a motorcycle"
	list_motors(selected_person)
	print "Select a motorcycle : "
	select_motor = gets.chomp.to_i
	if (select_motor-1) < 0 or (select_motor-1) >= selected_person.all_motors.length
		puts "Input is not in the list."
	else
		selected_motor = selected_person.all_motors[select_motor-1]
		display_all_details(selected_motor)
		exit = false
		begin
			puts "Delivery package to earn money"
			puts "1. Refill motorcycle"
			puts "2. Delivery package"
			puts "3. Exit"
			print "Select option : "
			option = gets.chomp.to_i
			case option
			when 1
				print "Refill (in liters) : "
				refill = gets.chomp.to_f
				selected_motor.refill(refill)
				refill_cost = refill * 5
				selected_person.decrease_money(refill_cost)
				puts "#{refill_cost}$ is used to refill."
			when 2
				dist_now = selected_motor.distance
				time_now = selected_motor.time
				max_time = selected_motor.max_time_ride
				time = rand(1..max_time)
				selected_motor.ride(time, selected_motor.velocity)
				if selected_motor.distance > dist_now
					income = (selected_motor.distance - dist_now) * 150
					selected_person.increase_money(income)
					puts "Earned #{income}"
				else
					selected_motor.distance = dist_now
					puts "Failed to earn."
				end
				broke = rand()
				if broke >= 0.75 then
					puts "MotorCycle broken. 150$ is used to repair."
					selected_person.decrease_money(150)
				end
				puts "END-OF-DELIVERY"
			when 3
				exit = true
			end
			end while !exit
	end
	puts "END-OF-SELECT"
end

def details(selected_person)
	puts "Details of the person"
	puts "Name : #{selected_person.name}"
	puts "Current fund : #{selected_person.money}"
	puts "Garage space : #{selected_person.garage_current_capacity}"
	puts "END-OF-DETAILS"
end

def delivery_package(selected_motor)
	
end

#MAIN MENUS

def create
	print "Name : "
	new_name = gets.chomp
	print "Garage space : "
	new_garage_space = gets.chomp.to_i
	print "Fund : "
	new_fund = gets.chomp.to_i
	new_person = Person.new(name: new_name, garage_space: new_garage_space, money: new_fund)
	@people << new_person
	puts "END-OF-CREATE"
end

def list
	@people.each_with_index do |person, index|
		index += 1
		puts "#{index}. #{person.name}"
	end
	puts "END-OF-LIST"
end

def select
	list
	print "Select person : "
	select_person = gets.chomp.to_i
	if (select_person-1) < 0 or (select_person-1) >= @people.length
		puts "Input is not on the list."
	else
		selected_person = @people[select_person-1]
		puts "MotorCycle -- #{selected_person.name}"
		exit = false
		begin
			puts "***SUBMENU***"
			puts "1. Buy a motorcyle"
			puts "2. List motorcyles"
			puts "3. Sell a motorcycle"
			puts "4. Select a motorcyle"
			puts "5. Details"
			puts "6. Exit"
			print "Choose your option: "
			answer = gets.chomp.to_i
			case answer
			when 1
				buy_motor(selected_person)
			when 2
				list_motors(selected_person)
			when 3
				sell_motor(selected_person)
			when 4
				select_motor(selected_person)
			when 5
				details(selected_person)
			when 6
				exit = true
			end
		end while !exit

	end
	puts "END-OF-SELECT"
end

def destroy
	list
	print "Select person : "
	select_person = gets.chomp.to_i
	if (select_person-1) < 0 or (select_person-1) >= @people.length
		puts "Input is not on the list."
	else
		selected_person = @people[select_person-1]
		@people.delete_if{ |person| person == selected_person}
		puts "#{selected_person.name} is deleted."
	end
	puts "END-OF-DESTROY"
end

exit = false
puts "CLI RUBY -- Person, Garage and MotorCycle"
begin
	puts "***MENU***"
	puts "1. Create a new person"
	puts "2. List all people"
	puts "3. Select one person"
	puts "4. Destroy a person"
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