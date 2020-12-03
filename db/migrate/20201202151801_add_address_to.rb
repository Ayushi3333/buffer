class AddAddressTo < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :address, :string
  end
end
