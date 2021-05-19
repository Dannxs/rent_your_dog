# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Dog.destroy_all
User.destroy_all

size = ["petit", "grand", "moyen"]
addresses = ["3 rue guynemer, Saint-Mandé", "16 villa gaudelet, Paris", "27 rue au pain, Saint-germain-en-laye", "14, Rue Chanoinesse, Paris 75004", "12 Avenue Beaucour, Paris"]

puts 'Creating fake users/dogs...'
20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: "password123",
    gender: Faker::Gender.type,
    age: rand(18..70),
    rating: rand(0..5)
  )
  user.save!
    2.times do
      dog = Dog.new(
        name: Faker::Name.first_name,
        size: size.sample,
        age: rand(1..15),
        color: Faker::Color.color_name,
        rating: rand(0..5),
        is_sterilized: Faker::Boolean.boolean,
        user_id: user.id,
        breed: Faker::Creature::Dog.breed,
        description: Faker::Movies::StarWars.quote,
        address: addresses.sample,
      )
      dog.save!
    end
end
puts 'Finished!'
