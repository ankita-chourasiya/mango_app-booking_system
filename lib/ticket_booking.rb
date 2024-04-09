require_relative '../initializer/movie'

class TicketBooking
  class BookingError < StandardError; end

  def self.book_ticket(movies, title, show_time, num_of_tickets)
    movie = find_movie(movies, title)
    show = find_show(movie, show_time)
    validate_seat_availability(show, num_of_tickets)
    allocate_seats(show, num_of_tickets).tap do |seat_range|
      return booking_confirmation(title, show_time, seat_range)
    end
  end

  private

  def self.find_movie(movies, title)
    movies.find { |m| m.title == title } || (raise BookingError, "Movie not found")
  end

  def self.find_show(movie, show_time)
    movie.shows.find { |s| s.time == show_time } || (raise BookingError, "Show not found")
  end

  def self.validate_seat_availability(show, num_of_tickets)
    available_seats = show.seats - show.booked_seats.size
    raise BookingError, "Not enough seats available" if num_of_tickets > available_seats
  end

  def self.allocate_seats(show, num_of_tickets)
    start_seat_number = show.booked_seats.last.to_i + 1
    end_seat_number = start_seat_number + num_of_tickets - 1

    show.booked_seats.concat((start_seat_number..end_seat_number).to_a)
    (start_seat_number..end_seat_number)
  end

  def self.booking_confirmation(title, show_time, seat_range)
    "Booked #{seat_range.size} tickets for '#{title}' at #{show_time}. Seat numbers: #{seat_range.first}-#{seat_range.last}."
  end
end
