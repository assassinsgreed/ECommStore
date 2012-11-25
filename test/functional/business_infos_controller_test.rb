require 'test_helper'

class BusinessInfosControllerTest < ActionController::TestCase
  setup do
    @business_info = business_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_info" do
    assert_difference('BusinessInfo.count') do
      post :create, business_info: @business_info.attributes
    end

    assert_redirected_to business_info_path(assigns(:business_info))
  end

  test "should show business_info" do
    get :show, id: @business_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_info
    assert_response :success
  end

  test "should update business_info" do
    put :update, id: @business_info, business_info: @business_info.attributes
    assert_redirected_to business_info_path(assigns(:business_info))
  end

  test "should destroy business_info" do
    assert_difference('BusinessInfo.count', -1) do
      delete :destroy, id: @business_info
    end

    assert_redirected_to business_infos_path
  end
end
