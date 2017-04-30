class AddRecipidToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :recipid, :integer
  end
end
