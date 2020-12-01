class Buddy < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  def self.search(search)
    if search
      @buddies = Buddy.where("name LIKE '%#{search}%'")
    else
      @buddies = Buddy.all
    end
  end
end
