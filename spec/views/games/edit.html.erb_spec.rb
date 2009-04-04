require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/games/edit.html.erb" do
  include GamesHelper
  
  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :new_record? => false,
      :name => "value for name",
      :capacity => 1,
      :creator_id => 1,
      :admin_id => 1,
      :game_type => "value for game_type",
      :status => "value for status"
    )
  end

  it "renders the edit game form" do
    render
    
    response.should have_tag("form[action=#{game_path(@game)}][method=post]") do
      with_tag('input#game_name[name=?]', "game[name]")
      with_tag('input#game_capacity[name=?]', "game[capacity]")
      with_tag('input#game_creator_id[name=?]', "game[creator_id]")
      with_tag('input#game_admin_id[name=?]', "game[admin_id]")
      with_tag('input#game_game_type[name=?]', "game[game_type]")
      with_tag('input#game_status[name=?]', "game[status]")
    end
  end
end


