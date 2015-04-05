require 'test_helper'

class CutesControllerTest < ActionController::TestCase
  setup do
    @cute = cutes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cutes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cute" do
    assert_difference('Cute.count') do
      post :create, cute: { title: @cute.title, url: @cute.url }
    end

    assert_redirected_to cute_path(assigns(:cute))
  end

  test "should show cute" do
    get :show, id: @cute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cute
    assert_response :success
  end

  test "should update cute" do
    patch :update, id: @cute, cute: { title: @cute.title, url: @cute.url }
    assert_redirected_to cute_path(assigns(:cute))
  end

  test "should destroy cute" do
    assert_difference('Cute.count', -1) do
      delete :destroy, id: @cute
    end

    assert_redirected_to cutes_path
  end
end
