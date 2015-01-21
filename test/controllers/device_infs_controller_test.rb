require 'test_helper'

class DeviceInfsControllerTest < ActionController::TestCase
  setup do
    @device_inf = device_infs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_infs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_inf" do
    assert_difference('DeviceInf.count') do
      post :create, device_inf: { browser: @device_inf.browser, comment_id: @device_inf.comment_id, os: @device_inf.os, post_id: @device_inf.post_id }
    end

    assert_redirected_to device_inf_path(assigns(:device_inf))
  end

  test "should show device_inf" do
    get :show, id: @device_inf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_inf
    assert_response :success
  end

  test "should update device_inf" do
    patch :update, id: @device_inf, device_inf: { browser: @device_inf.browser, comment_id: @device_inf.comment_id, os: @device_inf.os, post_id: @device_inf.post_id }
    assert_redirected_to device_inf_path(assigns(:device_inf))
  end

  test "should destroy device_inf" do
    assert_difference('DeviceInf.count', -1) do
      delete :destroy, id: @device_inf
    end

    assert_redirected_to device_infs_path
  end
end
