require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/games/new.html.erb" do
  include GamesHelper
  
  before(:each) do
    assigns[:game] = stub_model(Game,
      :new_record? => true,
      :name => "value for name",
      :capacity => 1,
      :creator_id => 1,
      :admin_id => 1,
      :game_type => "value for game_type",
      :status => "value for status"
    )
  end

  it "renders new game form" do
    render
    
    response.should have_tag("form[action=?][method=post]", games_path) do
      with_tag("input#game_name[name=?]", "game[name]")
      with_tag("input#game_capacity[name=?]", "game[capacity]")
      with_tag("input#game_creator_id[name=?]", "game[creator_id]")
      with_tag("input#game_admin_id[name=?]", "game[admin_id]")
      with_tag("input#game_game_type[name=?]", "game[game_type]")
      with_tag("input#game_status[name=?]", "game[status]")
    end
  end
end


