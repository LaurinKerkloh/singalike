# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create_with(password: "password").find_or_create_by!(email_address: "admin@example.com")

100.times do |index|
  Song.create_with(lyrics: rand(4..8).times.collect { Faker::Lorem.paragraph(sentence_count: 10, random_sentences_to_add: 20) }.join("\n\n")).find_or_create_by!(title: Faker::Music::RockBand.song, artist: Faker::Music::RockBand.name)
end
