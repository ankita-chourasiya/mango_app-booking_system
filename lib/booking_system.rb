require_relative '../initializer/movie'
require_relative 'ticket_booking'
require_relative 'ticket_cancellation'
require_relative 'status_display'

class BookingSystem
  attr_accessor :movies

  def initialize(movies)
    @movies = movies
  end

  def book_ticket(title, show_time, num_of_tickets)
    TicketBooking.book_ticket(@movies, title, show_time, num_of_tickets)
  end

  def cancel_ticket(title, show_time, seat_number)
    TicketCancellation.cancel_ticket(@movies, title, show_time, seat_number)
  end

  def display_status
    StatusDisplay.display_status(@movies)
  end
end
