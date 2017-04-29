json.extract! travel_package, :id, :name, :price, :location, :description, :flight_num, :flight_depart, :flight_arrive, :user_id, :created_at, :updated_at
json.url travel_package_url(travel_package, format: :json)
