class Buddy < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :description, :photo, presence: true
  before_save :reject_empty
  monetize :price_cents
  has_many :bookings

  def self.search(search)
    if search
      @buddies = Buddy.where("name LIKE '%#{search}%'")
    else
      @buddies = Buddy.all
    end
  end

  private

  def reject_empty
    tags.reject! { |tag| tag.empty? }
  end

end
