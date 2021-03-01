require "test_helper"

class PerformancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get performances_index_url
    assert_response :success
  end
end
