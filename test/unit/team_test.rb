require File.dirname(__FILE__) + '/../test_helper'

class TeamTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "the dd should has 2 members " do
    dd = teams(:dd)
    assert_equal dd.name,'DD'
    q=users(:quentin)
    a=users(:aaron)
    dd.members<<q
    dd.members<<a
    assert_equal 2,dd.members.size
  end

  test "should create a team" do
    assert_difference "Team.count" do
      team=create_team
      assert !team.new_record?, "#{team.errors.full_messages.to_sentence}"
    end
  end

  test "should require team name" do
     assert_no_difference "Team.count" do
       team=create_team(:name=>nil)
     end
  end
  test "should require team owner" do
     assert_no_difference "Team.count" do
       team=create_team(:owner_id=>nil)
     end
  end
protected 
  def create_team(options={})
    team=Team.new({:name=>'super_egg',:owner_id=>1 }.merge(options))
    team.save
    team
  end
    
end
