require 'test_helper'

class HealthControllerTest < ActionDispatch::IntegrationTest
  test "should get health" do
    get health_health_url
    assert_response :success
  end

end
