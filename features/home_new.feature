@tests
Feature: Home

  Scenario Outline: Verify home screen
    Given I am on home screen
    When I scroll till "<name>" from home screen
    Then I should see "<name>"
    Then I touch "<name>"
    Then I wait
    Then I should see a "DONE" button
    Then I press the "DONE" button
    Then I wait
    Then I wait to see "<name>" in row <num>
  Examples:
    | name      | num |
    | Barcelona | 2   |
    | Delhi     | 4   |
    | Paris     | 10  |
    | Dublin    | 6   |


  @test1
  Scenario Outline: Verify home screen table
    Given I select the city "<name>" from home screen
    Then I see details about the city
    When I navigate back to home screen
    Then I see city name in row <num>
  Examples:
    | name  | num |
    | Paris | 10  |
