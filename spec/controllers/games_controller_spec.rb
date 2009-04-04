require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GamesController do

  def mock_game(stubs={})
    @mock_game ||= mock_model(Game, stubs)
  end
  
  describe "GET index" do

    it "exposes all games as @games" do
      Game.should_receive(:find).with(:all).and_return([mock_game])
      get :index
      assigns[:games].should == [mock_game]
    end

    describe "with mime type of xml" do
  
      it "renders all games as xml" do
        Game.should_receive(:find).with(:all).and_return(games = mock("Array of Games"))
        games.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested game as @game" do
      Game.should_receive(:find).with("37").and_return(mock_game)
      get :show, :id => "37"
      assigns[:game].should equal(mock_game)
    end
    
    describe "with mime type of xml" do

      it "renders the requested game as xml" do
        Game.should_receive(:find).with("37").and_return(mock_game)
        mock_game.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new game as @game" do
      Game.should_receive(:new).and_return(mock_game)
      get :new
      assigns[:game].should equal(mock_game)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested game as @game" do
      Game.should_receive(:find).with("37").and_return(mock_game)
      get :edit, :id => "37"
      assigns[:game].should equal(mock_game)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created game as @game" do
        Game.should_receive(:new).with({'these' => 'params'}).and_return(mock_game(:save => true))
        post :create, :game => {:these => 'params'}
        assigns(:game).should equal(mock_game)
      end

      it "redirects to the created game" do
        Game.stub!(:new).and_return(mock_game(:save => true))
        post :create, :game => {}
        response.should redirect_to(game_url(mock_game))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved game as @game" do
        Game.stub!(:new).with({'these' => 'params'}).and_return(mock_game(:save => false))
        post :create, :game => {:these => 'params'}
        assigns(:game).should equal(mock_game)
      end

      it "re-renders the 'new' template" do
        Game.stub!(:new).and_return(mock_game(:save => false))
        post :create, :game => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested game" do
        Game.should_receive(:find).with("37").and_return(mock_game)
        mock_game.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :game => {:these => 'params'}
      end

      it "exposes the requested game as @game" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => true))
        put :update, :id => "1"
        assigns(:game).should equal(mock_game)
      end

      it "redirects to the game" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(game_url(mock_game))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested game" do
        Game.should_receive(:find).with("37").and_return(mock_game)
        mock_game.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :game => {:these => 'params'}
      end

      it "exposes the game as @game" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => false))
        put :update, :id => "1"
        assigns(:game).should equal(mock_game)
      end

      it "re-renders the 'edit' template" do
        Game.stub!(:find).and_return(mock_game(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested game" do
      Game.should_receive(:find).with("37").and_return(mock_game)
      mock_game.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the games list" do
      Game.stub!(:find).and_return(mock_game(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(games_url)
    end

  end

end
