require 'test_helper'

class CollegeNotesControllerTest < ActionController::TestCase
  setup do
    @college_note = college_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:college_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create college_note" do
    assert_difference('CollegeNote.count') do
      post :create, :college_note => @college_note.attributes
    end

    assert_redirected_to college_note_path(assigns(:college_note))
  end

  test "should show college_note" do
    get :show, :id => @college_note.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @college_note.to_param
    assert_response :success
  end

  test "should update college_note" do
    put :update, :id => @college_note.to_param, :college_note => @college_note.attributes
    assert_redirected_to college_note_path(assigns(:college_note))
  end

  test "should destroy college_note" do
    assert_difference('CollegeNote.count', -1) do
      delete :destroy, :id => @college_note.to_param
    end

    assert_redirected_to college_notes_path
  end
end
