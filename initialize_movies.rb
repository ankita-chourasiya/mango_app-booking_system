require 'json'
require_relative 'initializer/movie'
require_relative 'initializer/show'

def initialize_movies
  file_path = 'movies_data.json' # Update this to the correct path
  movie_data = JSON.parse(File.read(file_path))

  movie_data.map do |movie_hash|
    shows = movie_hash["shows"].map { |show_time, capacity| Show.new(show_time, capacity, []) }
    Movie.new(movie_hash["title"], movie_hash["genre"], shows)
  end
end
