class AddTagsToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :tags, :string, array:true, default: []
  end
end
