class AddPriceToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_monetize :buddies, :price, currency: { present: false }
  end
end
