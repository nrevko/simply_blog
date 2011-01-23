require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new, :post_id => posts(:one).id
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, :post_id => posts(:one).id, :comment => @comment.attributes
    end

    assert_redirected_to post_path(@comment.post_id)
  end

  test "should show comment" do
    get :show, :post_id => @comment.post_id, :id => @comment.to_param
    #assert_response :success

    assert_redirected_to post_comments_path
  end

  test "should get edit" do
    get :edit, :post_id => @comment.post_id, :id => @comment.to_param
    assert_response :success
  end

  test "should update comment" do
    put :update, :post_id => @comment.post_id, :id => @comment.to_param, :comment => @comment.attributes
    assert_redirected_to post_path(@comment.post_id)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, :post_id => @comment.post_id, :id => @comment.to_param
    end

    assert_redirected_to post_path(@comment.post_id)
  end
end
