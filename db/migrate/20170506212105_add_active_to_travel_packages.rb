class AddActiveToTravelPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :travel_packages, :active, :boolean
  end
end
