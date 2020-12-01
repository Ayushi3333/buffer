# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 
require 'faker'
require 'open-uri'

User.destroy_all
Buddy.destroy_all

user = User.create!({
  email: "test@email.com",
  password: "123456"
})

5.times do
  buddies = Buddy.new(
    name: Faker::Artist.name,
    description: Faker::Quote.famous_last_words,
    # photo: https://picsum.photos/200/300
    availability: true,
    user_id: user.id,
    )
    photo = URI.open('https://picsum.photos/200/300')
    buddies.photo.attach(io: photo, filename: 'buddy-avatar.png')
    buddies.save!
    puts "Finish seeding and created #{User.count} user & #{Buddy.count} buddies"
  end
    
# buddiesone = Buddy.new(
#   name: Faker::Artist.name,
#   description: Faker::Quote.famous_last_words,
#   availability: true,
#   user_id: user.id,
# )
# photo = URI.open('https://res.cloudinary.com/duuowhksu/image/upload/v1606486017/sample.jpg')
# buddiesone.photo.attach(io: photo, filename: 'buddy_one-avatar.png')
# buddiesone.save!
  
# buddiestwo = Buddy.new(
#   name: Faker::Artist.name,
#   description: Faker::Quote.famous_last_words,
#   availability: true,
#   user_id: user.id,
# )
# photo = URI.open('https://res.cloudinary.com/duuowhksu/image/upload/v1606486017/sample.jpg')
# buddiestwo.photo.attach(io: photo, filename: 'buddy_one-avatar.png')
# buddiestwo.save!

# buddiesthree = Buddy.new(
#   name: Faker::Artist.name,
#   description: Faker::Quote.famous_last_words,
#   availability: true,
#   user_id: user.id,
# )
# photo = URI.open('https://res.cloudinary.com/duuowhksu/image/upload/v1606486017/sample.jpg')
# buddiesthree.photo.attach(io: photo, filename: 'buddy_one-avatar.png')
# buddiesthree.save!
