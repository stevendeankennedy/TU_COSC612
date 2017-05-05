class CreatePurchaseHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_histories do |t|
      t.integer :amount
      t.references :user_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.references :travel_package_id, foreign_key: true

      t.timestamps
    end
  end
end
