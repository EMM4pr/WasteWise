require "test_helper"

class WasteItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get waste_items_new_url
    assert_response :success
  end

  test "should get create" do
    get waste_items_create_url
    assert_response :success
  end
end
