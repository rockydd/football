require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Game do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :capacity => 1,
      :creator_id => 1,
      :admin_id => 1,
      :game_type => "value for game_type",
      :status => "value for status",
      :start_time => Time.now,
      :end_time => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
end
