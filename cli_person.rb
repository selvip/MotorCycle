require_relative 'person'

@people = []

#SUBMENUS

def list_motors(selected_person)
	selected_person.display_garage
	puts "END-OF-MOTORLIST"
end

def add_motor(selected_person)
	puts "Add a new motorcyle"
	print "Name : "
	new_motor_name = gets.chomp
	print "Max capacity fuel : "
	new_max_capacity_fuel = gets.chomp.to_i
	print "Velocity : "
	new_velocity = gets.chomp.to_i
	print "Space : "
	new_space = gets.chomp.to_i
	new_motor = MotorCycle.new(new_motor_name, 0, new_max_capacity_fuel, new_velocity, 0, 0, new_space)
	selected_person.add_motor(new_motor)
	puts "END-OF-ADD"
end

def remove_motor(selected_person)
	puts "Remove a motorcycle"
	list_motors(selected_person)
	print "Select a motorcyle : "
	select_motor = gets.chomp.to_i
	if (select_motor-1) < 0 or (select_motor-1) >= selected_person.all_motors.length
		puts "Input is not in the list"
	else
		selected_motor = selected_person.all_motors[select_motor-1]
		selected_person.remove_motor(selected_motor)
		puts "#{selected_motor.name} has been removed from the list."
		list_motors(selected_person)
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
		selected_motor.display_name
		selected_motor.display_current_fuel
		selected_motor.display_max_capacity_fuel
		selected_motor.display_velocity
		selected_motor.display_distance
		selected_motor.display_time
	end
end

#MAIN MENUS

def create
	print "Name : "
	new_name = gets.chomp
	print "Garage space : "
	new_garage_space = gets.chomp.to_i
	new_person = Person.new(name: new_name, garage_space: new_garage_space)
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
			puts "1. List all motorcycles"
			puts "2. Add a motorcyle"
			puts "3. Remove a motorcycle"
			puts "4. Select a motorcyle"
			puts "5. Exit"
			print "Choose your option: "
			answer = gets.chomp.to_i
			case answer
			when 1
				list_motors(selected_person)
			when 2
				add_motor(selected_person)
			when 3
				remove_motor(selected_person)
			when 4
				select_motor(selected_person)
			when 5
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