require File.dirname(__FILE__) + '/../test_helper'

class TeamsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team" do
    login_as :aaron
    assert_difference('Team.count') do
      post :create, :team => {:name=>'dragon' }
      assert t=Team.find_by_name('dragon')
      assert_equal users(:aaron).id,t.owner_id
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, :id => teams(:dd).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => teams(:dd).id
    assert_response :success
  end

  test "should update team" do
    login_as :aaron
    put :update, :id => teams(:dd).id, :team => { }
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    login_as :aaron
    assert_difference('Team.count', -1) do
      delete :destroy, :id => teams(:dd).id
    end

    assert_redirected_to teams_path
  end

  test "should join team" do
  end
end
