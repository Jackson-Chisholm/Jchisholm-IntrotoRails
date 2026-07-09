# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
require "httparty"
Quote.destroy_all
Person.destroy_all

output = HTTParty.get('https://strangerthings-quotes.vercel.app/api/quotes/5')

data = JSON.parse(output.body)

data.each do |quote|
  newQ = Quote.new
  newQ.saying = quote["quote"]
  newQ.character = quote["author"]
  newQ.save
end

for a in 1...200 do
  newP = Person.new
  newP.name = Faker::Name.name
  newP.said_at = Faker::Date.between(from: 2.days.ago, to: Date.today)
  newP.quote = Quote.find_by(id: Faker::Number.between(from: 1, to: 5))
  newP.save
end



