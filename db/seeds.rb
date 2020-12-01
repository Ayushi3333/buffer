# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 
require 'faker'

user = User.create!({
  email: "test@email.com",
  password: "123456"
})


10.times do
  buddies = Buddy.create!(
    name: Faker::Artist.name,
    description: Faker::Quote.famous_last_words,
    # photo: https://picsum.photos/200/300
    availability: true,
    user_id: user.id
  )
end







