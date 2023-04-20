# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: 'Peter', email: 'peter@gmail.com', password: '123456')

random = (600..1000).to_a
300.times do
  title = Faker::Quote.famous_last_words
  content = Faker::Lorem.paragraph_by_chars(number: random.sample, supplemental: false)
  Article.create!(title: title, content: content)
end
