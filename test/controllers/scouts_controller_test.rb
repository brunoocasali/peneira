require 'test_helper'

class ScoutsControllerTest < ActionController::TestCase
  setup do
    @scout = scouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scout" do
    assert_difference('Scout.count') do
      post :create, scout: { actual_club_id: @scout.actual_club_id, user_id: @scout.user_id }
    end

    assert_redirected_to scout_path(assigns(:scout))
  end

  test "should show scout" do
    get :show, id: @scout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scout
    assert_response :success
  end

  test "should update scout" do
    patch :update, id: @scout, scout: { actual_club_id: @scout.actual_club_id, user_id: @scout.user_id }
    assert_redirected_to scout_path(assigns(:scout))
  end

  test "should destroy scout" do
    assert_difference('Scout.count', -1) do
      delete :destroy, id: @scout
    end

    assert_redirected_to scouts_path
  end
end
