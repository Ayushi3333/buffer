class AddBuddyAccountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_buddy, :boolean, default: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
