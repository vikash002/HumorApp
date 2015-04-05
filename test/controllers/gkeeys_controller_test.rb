require 'test_helper'

class GkeeysControllerTest < ActionController::TestCase
  setup do
    @gkeey = gkeeys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gkeeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gkeey" do
    assert_difference('Gkeey.count') do
      post :create, gkeey: { title: @gkeey.title, url: @gkeey.url }
    end

    assert_redirected_to gkeey_path(assigns(:gkeey))
  end

  test "should show gkeey" do
    get :show, id: @gkeey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gkeey
    assert_response :success
  end

  test "should update gkeey" do
    patch :update, id: @gkeey, gkeey: { title: @gkeey.title, url: @gkeey.url }
    assert_redirected_to gkeey_path(assigns(:gkeey))
  end

  test "should destroy gkeey" do
    assert_difference('Gkeey.count', -1) do
      delete :destroy, id: @gkeey
    end

    assert_redirected_to gkeeys_path
  end
end
