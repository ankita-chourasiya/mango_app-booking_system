require_relative 'initialize_movies'
require_relative 'lib/booking_system'

class MovieBookingCLI
  def initialize(booking_system)
    @booking_system = booking_system
  end

  def start
    puts "Welcome to the Movie Booking System"
    loop do
      display_options
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end

  private

  def display_options
    puts "\nOptions:"
    puts "1. Book a ticket"
    puts "2. Cancel a ticket"
    puts "3. Display status"
    puts "4. Exit"
    print "Enter your choice: "
  end

  def handle_choice(choice)
    case choice
    when 1 then book_ticket
    when 2 then cancel_ticket
    when 3 then display_status
    when 4 then exit_system
    else puts "Invalid option. Please try again."
    end
  end

  def book_ticket
    title, show_time, num_of_tickets = request_booking_details
    puts @booking_system.book_ticket(title, show_time, num_of_tickets)
  end

  def cancel_ticket
    title, show_time, seat_number = request_cancellation_details
    puts @booking_system.cancel_ticket(title, show_time, seat_number)
  end

  def display_status
    @booking_system.display_status
  end

  def exit_system
    puts "Thank you for using the Movie Booking System."
    exit
  end

  def request_booking_details
    print "Enter movie title: "
    title = gets.chomp
    print "Enter show time: "
    show_time = gets.chomp
    print "Enter number of tickets: "
    num_of_tickets = gets.chomp.to_i
    [title, show_time, num_of_tickets]
  end

  def request_cancellation_details
    print "Enter movie title: "
    title = gets.chomp
    print "Enter show time: "
    show_time = gets.chomp
    print "Enter seat number to cancel: "
    seat_number = gets.chomp.to_i
    [title, show_time, seat_number]
  end
end

movies = initialize_movies
booking_system = BookingSystem.new(movies)
cli = MovieBookingCLI.new(booking_system)
cli.start
