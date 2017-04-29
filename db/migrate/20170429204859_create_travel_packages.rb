class CreateTravelPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_packages do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.text :description
      t.string :flight_num
      t.string :flight_depart
      t.string :flight_arrive
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
