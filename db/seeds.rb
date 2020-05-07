# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
TagGossip.destroy_all
User.all.destroy_all
Tag.all.destroy_all
City.all.destroy_all
Gossip.all.destroy_all


10.times do |index|
  ville = City.create!(
    name: Faker::Address.city
  )
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    description: Faker::Lorem.sentence(word_count: 15),
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 1, to: 90),
    city: ville,
  )
  end

20.times do |index|
  Gossip.create!(
    title: Faker::Lorem.characters(number: 10, min_alpha: 10),
    content: Faker::Lorem.sentence(word_count: 15),
    user: User.find(rand(User.first.id..User.last.id)),
  )
end

10.times do |index|
  Tag.create!(
    title: Faker::Lorem.sentence(word_count: 1),
  )
  TagGossip.create!(
    tag: Tag.find(rand(Tag.first.id..Tag.last.id)),
    gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)),
  )
end