class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings
  has_one :profile, dependent: :destroy

  # def name
  #   self.profile.name.nil? ? "User#{}" : self.profile.name
  # end
  
  def create_profile
    # default_photo = 'https://i.imgur.com/SUfRG3j.png'
    @user = User.last
    @profile = Profile.new(buddy_name: "User#{@user.id}", description: '',user_id: @user.id  )
    @profile.save
  end
end
