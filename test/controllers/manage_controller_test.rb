require "test_helper"

class ManageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get manage_show_url
    assert_response :success
  end
end
