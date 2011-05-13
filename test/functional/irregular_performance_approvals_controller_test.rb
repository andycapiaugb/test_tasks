require 'test_helper'

class IrregularPerformanceApprovalsControllerTest < ActionController::TestCase
  setup do
    @irregular_performance_approval = irregular_performance_approvals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:irregular_performance_approvals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create irregular_performance_approval" do
    assert_difference('IrregularPerformanceApproval.count') do
      post :create, :irregular_performance_approval => @irregular_performance_approval.attributes
    end

    assert_redirected_to irregular_performance_approval_path(assigns(:irregular_performance_approval))
  end

  test "should show irregular_performance_approval" do
    get :show, :id => @irregular_performance_approval.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @irregular_performance_approval.to_param
    assert_response :success
  end

  test "should update irregular_performance_approval" do
    put :update, :id => @irregular_performance_approval.to_param, :irregular_performance_approval => @irregular_performance_approval.attributes
    assert_redirected_to irregular_performance_approval_path(assigns(:irregular_performance_approval))
  end

  test "should destroy irregular_performance_approval" do
    assert_difference('IrregularPerformanceApproval.count', -1) do
      delete :destroy, :id => @irregular_performance_approval.to_param
    end

    assert_redirected_to irregular_performance_approvals_path
  end
end
