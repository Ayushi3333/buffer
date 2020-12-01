require 'faker'
require 'open-uri'

Buddy.destroy_all
User.destroy_all

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
    
