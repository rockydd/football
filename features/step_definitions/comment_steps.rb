Given /^an normal user (.+) with the password (.+)/ do |username, password|
  User.create!(:login=>username,:password=>password,:password_confirmation=>password,:email=>"#{username}@gmail.com")
end

Given /^(.+) is not logged in/ do |username|

end

When /^(.+) visits the login page/ do |username|
  visit '/login'
end

When /^(.+) successfully submits the login form/ do |user_name|
  User.find_by_login()
  fills_in 'Login', :with => ''
  fills_in 'Password', :with => 'abracadabra'
  clicks_button
end

Given /^I logged in as (.+) with password (.+)$/ do |username,password|
  @current_user = User.create!(:login=>username,:password=>password,:password_confirmation=>password,:email=>"#{username}@gmail.com")

  visit new_session_path
  fill_in "Login", :with => @current_user.login
  fill_in "Password", :with => @current_user.password
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

#team
Given /a team named (.+)/ do |team_name|
  t=Team.create(:name=>team_name)
end

