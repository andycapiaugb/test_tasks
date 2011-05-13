require 'test_helper'

class NewEmployeeRequestsControllerTest < ActionController::TestCase
  setup do
    @new_employee_request = new_employee_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_employee_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_employee_request" do
    assert_difference('NewEmployeeRequest.count') do
      post :create, :new_employee_request => @new_employee_request.attributes
    end

    assert_redirected_to new_employee_request_path(assigns(:new_employee_request))
  end

  test "should show new_employee_request" do
    get :show, :id => @new_employee_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @new_employee_request.to_param
    assert_response :success
  end

  test "should update new_employee_request" do
    put :update, :id => @new_employee_request.to_param, :new_employee_request => @new_employee_request.attributes
    assert_redirected_to new_employee_request_path(assigns(:new_employee_request))
  end

  test "should destroy new_employee_request" do
    assert_difference('NewEmployeeRequest.count', -1) do
      delete :destroy, :id => @new_employee_request.to_param
    end

    assert_redirected_to new_employee_requests_path
  end
end
