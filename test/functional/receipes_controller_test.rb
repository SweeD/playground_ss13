require 'test_helper'

class ReceipesControllerTest < ActionController::TestCase
  setup do
    @receipe = receipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipe" do
    assert_difference('Receipe.count') do
      post :create, receipe: {  }
    end

    assert_redirected_to receipe_path(assigns(:receipe))
  end

  test "should show receipe" do
    get :show, id: @receipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipe
    assert_response :success
  end

  test "should update receipe" do
    put :update, id: @receipe, receipe: {  }
    assert_redirected_to receipe_path(assigns(:receipe))
  end

  test "should destroy receipe" do
    assert_difference('Receipe.count', -1) do
      delete :destroy, id: @receipe
    end

    assert_redirected_to receipes_path
  end
end
