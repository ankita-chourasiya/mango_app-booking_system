require_relative '../initializer/movie'
require_relative 'status_display'

class BookingSystem
  attr_accessor :movies

  def initialize(movies)
    @movies = movies
  end

  def display_status
    StatusDisplay.display_status(@movies)
  end
end
