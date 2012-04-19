require 'test_helper'

class AppraisalFormsControllerTest < ActionController::TestCase
  setup do
    @appraisal_form = appraisal_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appraisal_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appraisal_form" do
    assert_difference('AppraisalForm.count') do
      post :create, appraisal_form: @appraisal_form.attributes
    end

    assert_redirected_to appraisal_form_path(assigns(:appraisal_form))
  end

  test "should show appraisal_form" do
    get :show, id: @appraisal_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appraisal_form
    assert_response :success
  end

  test "should update appraisal_form" do
    put :update, id: @appraisal_form, appraisal_form: @appraisal_form.attributes
    assert_redirected_to appraisal_form_path(assigns(:appraisal_form))
  end

  test "should destroy appraisal_form" do
    assert_difference('AppraisalForm.count', -1) do
      delete :destroy, id: @appraisal_form
    end

    assert_redirected_to appraisal_forms_path
  end
end
