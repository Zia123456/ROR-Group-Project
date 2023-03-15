require "test_helper"

class ShoppingListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shopping_list_index_url
    assert_response :success
  end

  test "should get show" do
    get shopping_list_show_url
    assert_response :success
  end

  test "should get new" do
    get shopping_list_new_url
    assert_response :success
  end

  test "should get create" do
    get shopping_list_create_url
    assert_response :success
  end

  test "should get edit" do
    get shopping_list_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get shopping_list_destroy_url
    assert_response :success
  end
end
