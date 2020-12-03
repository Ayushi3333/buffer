class Buddy < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :name, :description, presence: true
  before_save :reject_empty
  monetize :price_cents

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
