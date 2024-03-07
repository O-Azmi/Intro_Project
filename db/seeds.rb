# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'csv'

# Populate Authors table
csv_file_authors = Rails.root.join('db/book_authors.csv')
csv_data_authors = File.read(csv_file_authors)
authors = CSV.parse(csv_data_authors, headers: true)

authors.take(50).each do |author|
    Author.find_or_create_by(author_name: author['Book-Author'], author_birthdate: Faker::Date.birthday(min_age: 20, max_age: 70))
  end

# Populate Genres table
csv_file_genres = Rails.root.join('db/books.csv')
csv_data_genres = File.read(csv_file_genres)
genres = CSV.parse(csv_data_genres, headers: true)

genres.each do |genre|
  Genre.find_or_create_by(genre_name: genre['Genre'])
end

# Populate Publishers table
60.times do
  Publisher.find_or_create_by(publisher_name: Faker::Book.publisher)
end

# Populate Books table
100.times do
  author = Author.order('RANDOM()').first
  publisher = Publisher.order('RANDOM()').first
  genre = Genre.order('RANDOM()').first

  Book.create(
    book_name: Faker::Book.title,
    author_id: author.id,
    publisher_id: publisher.id,
    genre_id: genre.id
  )
end

# Populate Publications table
Book.all.each do |book|
    Publication.create(publisher_id: book.publisher_id, book_id: book.id)
end
