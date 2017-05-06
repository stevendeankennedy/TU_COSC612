class CreatePurchaseHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_histories do |t|
      t.integer :amount
      # t.references :user_id, :traveller_id, foreign_key: true
      # t.references :user_id, :agent_id, foreign_key: true
      
      t.integer :traveller_id
      t.integer :agent_id
      t.integer :package_id
      
      t.string  :name
      t.string  :location
      
      # t.references :travel_package_id, foreign_key: true

      t.timestamps
    end
  end
end
