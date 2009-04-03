Feature: Manage comments
  In order to [give comments to players and teams and games]
  [users]
  wants [to added comments]

  Scenario: Login as merley
    Given an normal user Merley with the password dongdong
    And Merley is not logged in
    When I visits the login page
    And I fill in "Login" with "Merley"
    And I fill in "Password" with "dongdong"
    And I press "Log in"
    Then I should see "Welcome Merley"

  Scenario: check login
    Given I logged in as merley with password asdfghddd
    Then I should see "Welcome Merley"

  Scenario: Add new comment anonymously
    Given I am on the new comment page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Create"
    Then I should see "title 1"
    And I should see "body 1"
    And I should see "guest says:"

  Scenario: Add new comment as merley
    Given I logged in as merley with password asdfghddd
    And I am on the new comment page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Create"
    Then I should see "title 1"
    And I should see "body 1"
    And I should see "merley says:"

  Scenario: added comments for team
    Given a team named dd created by rocky
    And I logged in as merley with password fffffffff
    And I am on the team page
    And I follow the team dd link
    When I fill in "Comment" with "good team"
    And I press "say it"
    Then I should see "merley says:"
    And I should see "good team"


  Scenario: test team page
    Given a team named dd created by rocky
    When I am on the team page
    And I follow the team dd link
    And I fill in "comment_body" with "good team"
    Then I should see "Comment"



  Scenario: Delete comment
    Given the following comments:
      |title|body|user_id|
      |title 1|body 1|user_id 1|
      |title 2|body 2|user_id 2|
      |title 3|body 3|user_id 3|
      |title 4|body 4|user_id 4|
    When I delete the 3rd comment
    Then I should see the following comments:
      |user|title|body|
      |guest says:|title 1|body 1|
      |guest says:|title 2|body 2|
      |guest says:|title 4|body 4|
