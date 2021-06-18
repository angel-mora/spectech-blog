# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Check this reference https://learn.co/lessons/displaying-associations-rails

rails = Category.create!(name: 'rails', priority: 2)
2.times do
  rails.articles.create!(title: Faker::Name.title)
end

react = Category.create!(name: 'react', priority: 1)
2.times do
  react.articles.create!(title: Faker::Name.title)
end

devops = Category.create!(name: 'devops', priority: 5)
2.times do
  devops.articles.create!(title: Faker::Name.title)
end

news = Category.create!(name: 'news', priority: 3)
2.times do
  news.articles.create!(title: Faker::Name.title)
end

linux = Category.create!(name: 'linux', priority: 4)
2.times do
  linux.articles.create!(title: Faker::Name.title)
end

postgres = Category.create!(name: 'postgres', priority: 6)
2.times do
  postgres.articles.create!(title: Faker::Name.title)
end

18.times do
  User.create( name: Faker::Name.name_with_middle )
end
