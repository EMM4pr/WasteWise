require "test_helper"

class DisposalRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get disposal_records_create_url
    assert_response :success
  end
end
