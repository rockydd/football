require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true,
      :title => "value for title",
      :body => "value for body",
      :commentable_id => 1,
      :user_id => 1
    )
  end

  it "renders new comment form" do
    render
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("input#comment_title[name=?]", "comment[title]")
      with_tag("textarea#comment_body[name=?]", "comment[body]")
      with_tag("input#comment_commentable_id[name=?]", "comment[commentable_id]")
      with_tag("input#comment_user_id[name=?]", "comment[user_id]")
    end
  end
end


