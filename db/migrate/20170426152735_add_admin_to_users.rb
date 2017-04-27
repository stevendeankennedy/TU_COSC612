class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :usertype, :integer, default: 0  # 0-standard, 1-agent, 2-admin
  end
end
