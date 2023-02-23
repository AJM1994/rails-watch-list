# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'


# Make a GET request to the API endpoint and parse the JSON response
url = "http://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read
movies = JSON.parse(response)['results']

puts "Creating table.."
# Loop through the movie results and create a new Movie record for each movie
movies.each do |movie|
  # Extract relevant movie data
  puts "Creating new film.."
  title = movie['title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  rating = movie['vote_average']
  # Create a new Movie record in the database
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
puts "Finishing table."
