require 'test_helper'

class IrregularPerformanceRequestsControllerTest < ActionController::TestCase
  setup do
    @irregular_performance_request = irregular_performance_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:irregular_performance_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create irregular_performance_request" do
    assert_difference('IrregularPerformanceRequest.count') do
      post :create, :irregular_performance_request => @irregular_performance_request.attributes
    end

    assert_redirected_to irregular_performance_request_path(assigns(:irregular_performance_request))
  end

  test "should show irregular_performance_request" do
    get :show, :id => @irregular_performance_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @irregular_performance_request.to_param
    assert_response :success
  end

  test "should update irregular_performance_request" do
    put :update, :id => @irregular_performance_request.to_param, :irregular_performance_request => @irregular_performance_request.attributes
    assert_redirected_to irregular_performance_request_path(assigns(:irregular_performance_request))
  end

  test "should destroy irregular_performance_request" do
    assert_difference('IrregularPerformanceRequest.count', -1) do
      delete :destroy, :id => @irregular_performance_request.to_param
    end

    assert_redirected_to irregular_performance_requests_path
  end
end
