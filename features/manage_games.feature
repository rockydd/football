Feature: Manage games
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Register new game
    Given I am on the new game page
    When I fill in "Name" with "name 1"
    And I fill in "Capacity" with "1"
    And I fill in "Creator" with "1"
    And I fill in "Admin" with "1"
    And I fill in "Game type" with "game_type 1"
    And I fill in "Status" with "status 1"
    And I select "April 5, 2009 12:00" as the "Start time" date and time
    And I select "May 5, 2009 12:00" as the "End time" date and time
    And I press "Create"
    Then I should see "name 1"
    And I should see "1"
    And I should see "1"
    And I should see "1"
    And I should see "game_type 1"
    And I should see "status 1"
    And I should see "2009-04-05 12:00:00 UTC"
    And I should see "2009-05-05 12:00:00 UTC"

  Scenario: Delete game
    Given the following games:
      |name|capacity|creator_id|admin_id|game_type|status|start_time|end_time|
      |name 1|1|1|1|game_type 1|status 1|April 5, 2009 12:00|April 5, 2009 12:00|
      |name 2|2|2|2|game_type 2|status 2|April 5, 2009 12:00|April 5, 2009 12:00|
      |name 3|3|3|3|game_type 3|status 3|April 5, 2009 12:00|April 5, 2009 12:00|
      |name 4|4|4|4|game_type 4|status 4|April 5, 2009 12:00|April 5, 2009 12:00|
    When I delete the 3rd game
    Then I should see the following games:
      |name|capacity|creator_id|admin_id|game_type|status|start_time|end_time|
      |name 1|1|1|1|game_type 1|status 1|2009-04-05 12:00:00 UTC|2009-04-05 12:00:00 UTC|
      |name 2|2|2|2|game_type 2|status 2|2009-04-05 12:00:00 UTC|2009-04-05 12:00:00 UTC|
      |name 4|4|4|4|game_type 4|status 4|2009-04-05 12:00:00 UTC|2009-04-05 12:00:00 UTC|

