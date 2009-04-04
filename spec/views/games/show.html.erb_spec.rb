require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/games/show.html.erb" do
  include GamesHelper
  before(:each) do
    assigns[:game] = @game = stub_model(Game,
      :name => "value for name",
      :capacity => 1,
      :creator_id => 1,
      :admin_id => 1,
      :game_type => "value for game_type",
      :status => "value for status"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ game_type/)
    response.should have_text(/value\ for\ status/)
  end
end

