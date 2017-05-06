class AddReturnAirportToTravelPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :travel_packages, :returnairport, :string
  end
end
