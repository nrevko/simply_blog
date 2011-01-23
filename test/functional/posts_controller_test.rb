require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  fixtures :categories
  fixtures :posts

  setup do
    @post = posts(:three)
    @update = {         :post_text => "YYY",
                        :category_id => categories(:one).id}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      ppost = Post.new( :post_title => "My Creative Post #22",
                        :post_text => "YYY",
                        :category_id => categories(:one).id)
      post :create, :post => ppost.attributes
    end

    assert_redirected_to posts_url
  end

  test "should show post" do
    get :show, :id => @post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post.to_param
    assert_response :success
  end

  test "should update post" do
    put :update, :id => @post.to_param, :post => @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => @post.to_param
    end

    assert_redirected_to posts_path
  end
end
