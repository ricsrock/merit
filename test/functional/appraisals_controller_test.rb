require 'test_helper'

class AppraisalsControllerTest < ActionController::TestCase
  setup do
    @appraisal = appraisals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appraisals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appraisal" do
    assert_difference('Appraisal.count') do
      post :create, appraisal: @appraisal.attributes
    end

    assert_redirected_to appraisal_path(assigns(:appraisal))
  end

  test "should show appraisal" do
    get :show, id: @appraisal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appraisal
    assert_response :success
  end

  test "should update appraisal" do
    put :update, id: @appraisal, appraisal: @appraisal.attributes
    assert_redirected_to appraisal_path(assigns(:appraisal))
  end

  test "should destroy appraisal" do
    assert_difference('Appraisal.count', -1) do
      delete :destroy, id: @appraisal
    end

    assert_redirected_to appraisals_path
  end
end
