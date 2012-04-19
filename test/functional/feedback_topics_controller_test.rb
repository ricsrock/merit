require 'test_helper'

class FeedbackTopicsControllerTest < ActionController::TestCase
  setup do
    @feedback_topic = feedback_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_topic" do
    assert_difference('FeedbackTopic.count') do
      post :create, feedback_topic: @feedback_topic.attributes
    end

    assert_redirected_to feedback_topic_path(assigns(:feedback_topic))
  end

  test "should show feedback_topic" do
    get :show, id: @feedback_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_topic
    assert_response :success
  end

  test "should update feedback_topic" do
    put :update, id: @feedback_topic, feedback_topic: @feedback_topic.attributes
    assert_redirected_to feedback_topic_path(assigns(:feedback_topic))
  end

  test "should destroy feedback_topic" do
    assert_difference('FeedbackTopic.count', -1) do
      delete :destroy, id: @feedback_topic
    end

    assert_redirected_to feedback_topics_path
  end
end
