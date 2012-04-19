require 'test_helper'

class ReviewPeriodsControllerTest < ActionController::TestCase
  setup do
    @review_period = review_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_period" do
    assert_difference('ReviewPeriod.count') do
      post :create, review_period: @review_period.attributes
    end

    assert_redirected_to review_period_path(assigns(:review_period))
  end

  test "should show review_period" do
    get :show, id: @review_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review_period
    assert_response :success
  end

  test "should update review_period" do
    put :update, id: @review_period, review_period: @review_period.attributes
    assert_redirected_to review_period_path(assigns(:review_period))
  end

  test "should destroy review_period" do
    assert_difference('ReviewPeriod.count', -1) do
      delete :destroy, id: @review_period
    end

    assert_redirected_to review_periods_path
  end
end
