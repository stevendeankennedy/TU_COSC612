class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.boolean :confirmed
      t.integer :user
      t.integer :friend
      t.string  :friend_name
      t.string  :friend_email

      t.timestamps
    end
  end
end
