class RemovePhotoFromBuddy < ActiveRecord::Migration[6.0]
  def change
    remove_column :buddies, :photo, :string
  end
end
