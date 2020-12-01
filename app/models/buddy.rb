class Buddy < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :description, :photo, presence: true

  def self.search(search)
    if search
      @buddies = Buddy.where("name LIKE '%#{search}%'")
    else
      @buddies = Buddy.all
    end
  end
end
