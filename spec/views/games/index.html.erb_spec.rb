require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/games/index.html.erb" do
  include GamesHelper
  
  before(:each) do
    assigns[:games] = [
      stub_model(Game,
        :name => "value for name",
        :capacity => 1,
        :creator_id => 1,
        :admin_id => 1,
        :game_type => "value for game_type",
        :status => "value for status"
      ),
      stub_model(Game,
        :name => "value for name",
        :capacity => 1,
        :creator_id => 1,
        :admin_id => 1,
        :game_type => "value for game_type",
        :status => "value for status"
      )
    ]
  end

  it "renders a list of games" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for game_type".to_s, 2)
    response.should have_tag("tr>td", "value for status".to_s, 2)
  end
end

