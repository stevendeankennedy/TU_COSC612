class AddAirportToTravelPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :travel_packages, :airport, :string
  end
end
