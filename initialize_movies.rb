require_relative 'initializer/movie'
require_relative 'initializer/show'

def initialize_movies
  [
    Movie.new("Pathaan", "Action", [
      Show.new("1:00 PM", 200, []),
      Show.new("4:00 PM", 200, [])
    ]),
    Movie.new("Brahmāstra", "Fantasy", [
      Show.new("6:00 PM", 200, []),
      Show.new("9:00 PM", 200, [])
    ]),
    Movie.new("Gangubai Kathiawadi", "Biographical", [
      Show.new("2:00 PM", 150, []),
      Show.new("5:00 PM", 150, [])
    ]),
    Movie.new("RRR", "Epic", [
      Show.new("7:00 PM", 250, []),
      Show.new("10:00 PM", 250, [])
    ])
  ]
end