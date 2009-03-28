require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :title => "value for title",
      :body => "value for body",
      :commentable_id => 1,
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

