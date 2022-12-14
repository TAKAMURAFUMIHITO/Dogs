require "test_helper"

class Admin::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_members_index_url
    assert_response :success
  end

  test "should get ahow" do
    get admin_members_ahow_url
    assert_response :success
  end

  test "should get edit" do
    get admin_members_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_members_update_url
    assert_response :success
  end
end
