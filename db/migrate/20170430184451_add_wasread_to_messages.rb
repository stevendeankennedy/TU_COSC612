class AddWasreadToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :wasread, :boolean
  end
end
