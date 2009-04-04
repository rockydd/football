require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GamesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "games", :action => "index").should == "/games"
    end
  
    it "maps #new" do
      route_for(:controller => "games", :action => "new").should == "/games/new"
    end
  
    it "maps #show" do
      route_for(:controller => "games", :action => "show", :id => "1").should == "/games/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "games", :action => "edit", :id => "1").should == "/games/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "games", :action => "create").should == {:path => "/games", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "games", :action => "update", :id => "1").should == {:path =>"/games/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "games", :action => "destroy", :id => "1").should == {:path =>"/games/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/games").should == {:controller => "games", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/games/new").should == {:controller => "games", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/games").should == {:controller => "games", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/games/1").should == {:controller => "games", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/games/1/edit").should == {:controller => "games", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/games/1").should == {:controller => "games", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/games/1").should == {:controller => "games", :action => "destroy", :id => "1"}
    end
  end
end
