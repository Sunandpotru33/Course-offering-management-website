require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dashboard_show_url
    assert_response :success
  end

  test "should get my_courses" do
    get dashboard_my_courses_url
    assert_response :success
  end
end
