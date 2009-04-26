module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the homepage/
      root_path
    when /the new game page/
      new_game_path
    when /the game page/
      games_path
    when /the new comment page/
      new_comment_path

    when /the team page/
      teams_path

    # Add more page name => path mappings here

    else
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World do |world|
  world.extend NavigationHelpers
  world
end
