class CreateBuddies < ActiveRecord::Migration[6.0]
  def change
    create_table :buddies do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :photo
      t.boolean :availability

      t.timestamps
    end
  end
end
