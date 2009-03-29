Given /^I am logged in$/ do
  @current_user = create_user

  visit_new_session_path
  fill_in "Login", :with => @current_user.login
  fill_in "Password", :with => valid_user_attributes['password']
  click_button
end

Given /^the following comments:$/ do |comments|
  Comment.create!(comments.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) comment$/ do |pos|
  visit comments_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following comments:$/ do |comments|
  comments.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end
