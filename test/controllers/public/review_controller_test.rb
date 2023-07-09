require "test_helper"

class Public::ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_review_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_review_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_review_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_review_destroy_url
    assert_response :success
  end
end
