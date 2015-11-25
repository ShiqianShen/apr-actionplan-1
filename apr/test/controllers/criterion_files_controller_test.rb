require 'test_helper'

class CriterionFilesControllerTest < ActionController::TestCase
  setup do
    @criterion_file = criterion_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criterion_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criterion_file" do
    assert_difference('CriterionFile.count') do
      post :create, criterion_file: { attachment: @criterion_file.attachment, criterion_detail_id: @criterion_file.criterion_detail_id, name: @criterion_file.name }
    end

    assert_redirected_to criterion_file_path(assigns(:criterion_file))
  end

  test "should show criterion_file" do
    get :show, id: @criterion_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criterion_file
    assert_response :success
  end

  test "should update criterion_file" do
    patch :update, id: @criterion_file, criterion_file: { attachment: @criterion_file.attachment, criterion_detail_id: @criterion_file.criterion_detail_id, name: @criterion_file.name }
    assert_redirected_to criterion_file_path(assigns(:criterion_file))
  end

  test "should destroy criterion_file" do
    assert_difference('CriterionFile.count', -1) do
      delete :destroy, id: @criterion_file
    end

    assert_redirected_to criterion_files_path
  end
end
