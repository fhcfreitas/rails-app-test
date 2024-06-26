require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get products_home_url
    assert_response :success
  end

  test "should get show" do
    get products_show_url
    assert_response :success
  end

  test "should get new" do
    get products_new_url
    assert_response :success
  end

  test "should get edit" do
    get products_edit_url
    assert_response :success
  end
end
