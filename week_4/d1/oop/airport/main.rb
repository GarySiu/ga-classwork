require_relative 'airport'
require_relative 'flight'
require_relative 'passenger'

lhr = Airport.new('London Heathrow')

def list_flights airport
  airport.flights.each_with_index { |flight, index| puts "#{index}: #{flight}" }
end

def list_passengers flight
  flight.passengers.each_with_index { |passenger, index| puts "#{index}: #{passenger.name}" }
end

def menu
  puts `clear`
  puts '*' * 52
  puts "* Welcome to London Heathrow! *".center 50
  puts '*' * 52
  puts '1: Add a flight'
  puts '2: List flights'
  puts '3: Add a passenger to a flight'
  puts '4: List passengers on a flight'
  puts 'q: Quit'
  print '-->'
  gets.chomp
end

response = menu

while response.downcase != 'q'
  case response
  when '1' # Add a flight
    puts 'How many passengers on this flight?'
    number_of_seats = gets.to_i
    puts 'What is the flight\'s destination?'
    destination = gets.chomp

    puts lhr.add_flight(number_of_seats, destination)
    gets
  when '2' # List flights
    puts 'Here are all the flights'
    list_flights(lhr)
    gets
  when '3' # Add a passenger to a flight
    # Create passenger
    puts 'What is the passenger\'s name?'
    name = gets.chomp
    passenger = Passenger.new name

    # ask user what flight they want to be added to
    # list flights so it can be selected
    puts "What flight do you want #{passenger.name} to be added to?"
    list_flights(lhr)

    flight_number = gets.to_i
    flight = lhr.flights[flight_number]

    flight.add_passenger(passenger)
    puts "#{passenger.name} has been added to #{flight}"
    gets

  when '4' # List passengers on a flight

    # List the flights
    puts 'What flight do you want to list the passenger from?'
    list_flights(lhr)

    # Choose a flight
    flight_number = gets.to_i
    flight = lhr.flights[flight_number]

    # Loop through the passengers array in a nice way
    puts 'The passengers for this flight are:'
    list_passengers(flight)
    gets

  end

  response = menu

end