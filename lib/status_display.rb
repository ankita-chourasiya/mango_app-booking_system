class StatusDisplay
  def self.display_status(movies)
    movies.each do |movie|
      puts format_movie(movie)
    end
  end

  private

  def self.format_movie(movie)
    movie_info = "Movie: #{movie.title}\n"
    show_info = movie.shows.map { |show| format_show(show) }.join("\n")
    "#{movie_info}#{show_info}"
  end

  def self.format_show(show)
    available_seats = show.seats - show.booked_seats.size
    "  Show Time: #{show.time}, Available Seats: #{available_seats}/#{show.seats}"
  end
end
