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

    photo = URI.open('https://images.unsplash.com/photo-1569003339405-ea396a5a8a90?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
    photo_1 = URI.open('https://images.unsplash.com/photo-1558507334-57300f59f0bd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
    photo_2 = URI.open('https://images.unsplash.com/photo-1542623024-a797a755b8d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80')
    photos << photo
    photos << photo_1
    photos << photo_2

    photos.each do |photo|
      buddies.photos.attach(io: photo, filename: 'buddy-avatar.png')
    end
    buddies.save!
    
    puts "Finish seeding and created #{User.count} user & #{Buddy.count} buddies"
  end

