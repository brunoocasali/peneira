require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
  setup do
    @athlete = athletes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:athletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create athlete" do
    assert_difference('Athlete.count') do
      post :create, athlete: { allow_to_travel: @athlete.allow_to_travel, birthday: @athlete.birthday, foot_id: @athlete.foot_id, height: @athlete.height, position_id: @athlete.position_id, user_id: @athlete.user_id, weight: @athlete.weight }
    end

    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should show athlete" do
    get :show, id: @athlete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @athlete
    assert_response :success
  end

  test "should update athlete" do
    patch :update, id: @athlete, athlete: { allow_to_travel: @athlete.allow_to_travel, birthday: @athlete.birthday, foot_id: @athlete.foot_id, height: @athlete.height, position_id: @athlete.position_id, user_id: @athlete.user_id, weight: @athlete.weight }
    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should destroy athlete" do
    assert_difference('Athlete.count', -1) do
      delete :destroy, id: @athlete
    end

    assert_redirected_to athletes_path
  end
end
