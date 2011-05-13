require 'test_helper'

class AbsenceRequestsControllerTest < ActionController::TestCase
  setup do
    @absence_request = absence_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:absence_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create absence_request" do
    assert_difference('AbsenceRequest.count') do
      post :create, :absence_request => @absence_request.attributes
    end

    assert_redirected_to absence_request_path(assigns(:absence_request))
  end

  test "should show absence_request" do
    get :show, :id => @absence_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @absence_request.to_param
    assert_response :success
  end

  test "should update absence_request" do
    put :update, :id => @absence_request.to_param, :absence_request => @absence_request.attributes
    assert_redirected_to absence_request_path(assigns(:absence_request))
  end

  test "should destroy absence_request" do
    assert_difference('AbsenceRequest.count', -1) do
      delete :destroy, :id => @absence_request.to_param
    end

    assert_redirected_to absence_requests_path
  end
end
