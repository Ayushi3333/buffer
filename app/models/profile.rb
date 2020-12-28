class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, through: :user
  has_many :bars, through: :bookings


  def photo_url
    if photo.attached?
      photo.key
    else
      "https://i.pinimg.com/474x/6f/64/60/6f6460212a397968497afbb9d81d6b3a.jpg"
    end
  end
end


