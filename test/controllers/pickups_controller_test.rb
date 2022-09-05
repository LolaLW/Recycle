require "test_helper"

class PickupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pickups_new_url
    assert_response :success
  end

  test "should get create" do
    get pickups_create_url
    assert_response :success
  end
end
