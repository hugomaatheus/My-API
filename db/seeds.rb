# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Book.create({
    title:Faker::Book.title,
    abstract:Faker::Lorem.sentence
    })
end

3.times do
  Author.create({
    name:Faker::Name.name_with_middle,
    age:Faker::Number.between(18, 100)
    })
end
