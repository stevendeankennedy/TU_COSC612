require 'test_helper'

class TravelPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_package = travel_packages(:one)
  end

  # test "should get index" do
  #   get travel_packages_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_travel_package_url
    assert_response :success
  end

  # test "should create travel_package" do
  #   assert_difference('TravelPackage.count') do
  #     post travel_packages_url, params: { travel_package: { description: @travel_package.description, flight_arrive: @travel_package.flight_arrive, flight_depart: @travel_package.flight_depart, flight_num: @travel_package.flight_num, location: @travel_package.location, name: @travel_package.name, price: @travel_package.price, user_id: @travel_package.user_id } }
  #   end

  #   assert_redirected_to travel_package_url(TravelPackage.last)
  # end

  test "should show travel_package" do
    get travel_package_url(@travel_package)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_travel_package_url(@travel_package)
  #   assert_response :success
  # end

  # test "should update travel_package" do
  #   patch travel_package_url(@travel_package), params: { travel_package: { description: @travel_package.description, flight_arrive: @travel_package.flight_arrive, flight_depart: @travel_package.flight_depart, flight_num: @travel_package.flight_num, location: @travel_package.location, name: @travel_package.name, price: @travel_package.price, user_id: @travel_package.user_id } }
  #   assert_redirected_to travel_package_url(@travel_package)
  # end

  # test "should destroy travel_package" do
  #   assert_difference('TravelPackage.count', -1) do
  #     delete travel_package_url(@travel_package)
  #   end

  #   assert_redirected_to travel_packages_url
  # end
end
