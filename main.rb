puts "Welcome to the Movie Booking System"

loop do
  puts "\nOptions:"
  puts "1. Book a ticket"
  puts "2. Cancel a ticket"
  puts "3. Display status"
  puts "4. Exit"

  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter movie title: "
    title = gets.chomp
    print "Enter show time: "
    show_time = gets.chomp
    print "Enter number of tickets: "
    num_of_tickets = gets.chomp.to_i
  when 2
    print "Enter movie title: "
    title = gets.chomp
    print "Enter show time: "
    show_time = gets.chomp
    print "Enter seat number to cancel: "
    seat_number = gets.chomp.to_i
  when 3
    puts "Display status"
  when 4
    puts "Thank you for using the Movie Booking System."
    break
  else
    puts "Invalid option. Please try again."
  end
end
