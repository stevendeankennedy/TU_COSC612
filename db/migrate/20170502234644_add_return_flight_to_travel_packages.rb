class AddReturnFlightToTravelPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :travel_packages, :return_num, :string
    add_column :travel_packages, :return_depart, :string
    add_column :travel_packages, :return_arrive, :string
  end
end
