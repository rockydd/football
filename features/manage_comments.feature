Feature: Manage comments
  In order to [give comments to players and teams and games]
  [users]
  wants [to added comments]

  Scenario: Add new comment
    Given I am on the new comment page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Create"
    Then I should see "title 1"
    And I should see "body 1"
    And I should see "rocky says:"

  Scenario: Delete comment
    Given the following comments:
      |title|body|user_id|
      |title 1|body 1|user_id 1|
      |title 2|body 2|user_id 2|
      |title 3|body 3|user_id 3|
      |title 4|body 4|user_id 4|
    When I delete the 3rd comment
    Then I should see the following comments:
      |title|body|
      |title 1|body 1|
      |title 2|body 2|
      |title 4|body 4|
