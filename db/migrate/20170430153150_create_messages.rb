class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :recipient
      t.text :message
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
