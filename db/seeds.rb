require 'faker'
require 'open-uri'

Buddy.destroy_all
User.destroy_all

user = User.create!({
  email: "test@email.com",
  password: "123456"
})
tags = ["Diplomatic", 'Shredded', 'Possessive', 'Motherly', 'Comforting', 'Tough love', 'Social', 'Memory', 'Designated driver', 'Wing Man' ]
addresses = ['Barcelona, Spain', 'Berlin, Germany', 'Madrid, Spain', 'Paris, France', 'London, United Kingdom']

5.times do
  buddies = Buddy.new(
    name: Faker::Artist.name,
    description: Faker::Quote.famous_last_words,
    availability: true,
    tags: tags.sample(3),
    user_id: user.id,
    address: addresses.sample,
    price_cents: rand(10..50)
    )
  photos = []
    photo = URI.open('https://picsum.photos/200/300')
    photo_1 = URI.open('https://picsum.photos/200/300')
    photo_2 = URI.open('https://picsum.photos/200/300')
    photos << photo
    photos << photo_1
    photos << photo_2

    photos.each do |photo|
      buddies.photos.attach(io: photo, filename: 'buddy-avatar.png')
    end
    buddies.save!
    
    puts "Finish seeding and created #{User.count} user & #{Buddy.count} buddies"
  end

