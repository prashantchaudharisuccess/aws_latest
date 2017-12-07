require 'test_helper'

class BucketFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bucket_files_index_url
    assert_response :success
  end

end
