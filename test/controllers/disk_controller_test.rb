require 'test_helper'

class DiskControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get disk_index_url
    assert_response :success
  end

end
