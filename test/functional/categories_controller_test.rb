require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

#adding a new category, cannot user the one in fixtures because they are already in db
  #new category needs unique name
  test "should create category" do
    assert_difference('Category.count') do
      cattegory = Category.new(:category_name => "MyNewCategory")
      post :create, :category => cattegory.attributes
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, :id => @category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @category.to_param
    assert_response :success
  end

  test "should update category" do
    put :update, :id => @category.to_param, :category => @category.attributes
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, :id => @category.to_param
    end

    assert_redirected_to categories_path
  end
end
