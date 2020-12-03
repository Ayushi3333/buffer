class AddCoordinatesTo < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :latitude, :float
    add_column :buddies, :longitude, :float
  end
end
