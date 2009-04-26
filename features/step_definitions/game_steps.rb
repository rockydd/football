Given /^the following games:$/ do |games|
  Game.create!(games.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) game$/ do |pos|
  visit games_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following games:$/ do |games|
  games.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end


Given /^a new league game named (.+)$/ do |game_name|
  Game.create!(:name=> game_name,:capacity => 20)
end

Given /^game (.+) was registered by (.+)$/ do |game_name,teams|
  game = Game.find_by_name(game_name)
  u=User.create!(:login=>'rocky', :password=>'password',:password_confirmation=>'password',:email=>'rockydd@gmail.com')
  teams.split(',').each do |name|
    t=Team.create!(:name=>name,:owner_id=>u.id)
    game.register(t)
  end
end

When /^I follow the game link 'CIG'$/ do
  game = Game.find_by_name('CIG')
  visit game_path(game)
end

# Then /^I should see 'dd'$/ do
#   pending
# end

# Then /^I should see 'tt'$/ do
#   pending
# end

# Then /^I should see 'xiangrui'$/ do
#   pending
# end

