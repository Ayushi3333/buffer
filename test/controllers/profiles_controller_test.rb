require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get :show" do
    get profiles_:show_url
    assert_response :success
  end

  test "should get :edit" do
    get profiles_:edit_url
    assert_response :success
  end

  test "should get :update" do
    get profiles_:update_url
    assert_response :success
  end

  test "should get :new" do
    get profiles_:new_url
    assert_response :success
  end

  test "should get :create" do
    get profiles_:create_url
    assert_response :success
  end

  test "should get :destroy" do
    get profiles_:destroy_url
    assert_response :success
  end

end
