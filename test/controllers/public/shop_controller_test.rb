require "test_helper"

class Public::ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shop_index_url
    assert_response :success
  end

  test "should get show" do
    get public_shop_show_url
    assert_response :success
  end
end
