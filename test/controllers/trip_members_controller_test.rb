require 'test_helper'

class TripMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get trip_members_new_url
    assert_response :success
  end

  test "should get create" do
    get trip_members_create_url
    assert_response :success
  end

end
