require 'test_helper'

class DeviseInfsControllerTest < ActionController::TestCase
  setup do
    @devise_inf = devise_infs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devise_infs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create devise_inf" do
    assert_difference('DeviseInf.count') do
      post :create, devise_inf: { browser: @devise_inf.browser, comment_id: @devise_inf.comment_id, os: @devise_inf.os, post_id: @devise_inf.post_id }
    end

    assert_redirected_to devise_inf_path(assigns(:devise_inf))
  end

  test "should show devise_inf" do
    get :show, id: @devise_inf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @devise_inf
    assert_response :success
  end

  test "should update devise_inf" do
    patch :update, id: @devise_inf, devise_inf: { browser: @devise_inf.browser, comment_id: @devise_inf.comment_id, os: @devise_inf.os, post_id: @devise_inf.post_id }
    assert_redirected_to devise_inf_path(assigns(:devise_inf))
  end

  test "should destroy devise_inf" do
    assert_difference('DeviseInf.count', -1) do
      delete :destroy, id: @devise_inf
    end

    assert_redirected_to devise_infs_path
  end
end
