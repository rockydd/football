require File.dirname(__FILE__) + '/../test_helper'

class TeamsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    login_as(users(:aaron))
    get :new
    assert_response :success
  end

  test "should create team" do
    login_as :aaron
    assert_difference('Team.count') do
      post :create, :team => {:name=>'dragon' }
      assert t=Team.find_by_name('dragon')
      assert_equal users(:aaron).id,t.owner_id
      assert_equal 1,t.members.size
      assert_equal users(:aaron).id,t.members[0].id
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, :id => teams(:dd).id
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:aaron))
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
    qt=users(:quentin)
    dd=teams(:dd)
    post :join,:id => dd.id
    assert_redirected_to :controller=>:session,:action => :new
    login_as :quentin
    post :join, :id => teams(:dd).id 
    assert_redirected_to team_path(dd)
  end
end
