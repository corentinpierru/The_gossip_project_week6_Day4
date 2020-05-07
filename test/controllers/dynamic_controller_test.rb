require 'test_helper'

class DynamicControllerTest < ActionDispatch::IntegrationTest
  test "should get first_name" do
    get dynamic_first_name_url
    assert_response :success
  end

end
