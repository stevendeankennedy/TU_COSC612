class AddTagsToTravelPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :travel_packages, :tags, :string
  end
end
