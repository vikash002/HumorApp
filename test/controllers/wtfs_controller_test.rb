require 'test_helper'

class WtfsControllerTest < ActionController::TestCase
  setup do
    @wtf = wtfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wtfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wtf" do
    assert_difference('Wtf.count') do
      post :create, wtf: { title: @wtf.title, url: @wtf.url }
    end

    assert_redirected_to wtf_path(assigns(:wtf))
  end

  test "should show wtf" do
    get :show, id: @wtf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wtf
    assert_response :success
  end

  test "should update wtf" do
    patch :update, id: @wtf, wtf: { title: @wtf.title, url: @wtf.url }
    assert_redirected_to wtf_path(assigns(:wtf))
  end

  test "should destroy wtf" do
    assert_difference('Wtf.count', -1) do
      delete :destroy, id: @wtf
    end

    assert_redirected_to wtfs_path
  end
end
