@tests
Feature: Home

  @test1 @reset
  Scenario: Verify home screen
    Given I am on home screen
    Then I should see "Barcelona"
    Then I touch "Barcelona"
    Then I wait
    Then I should see a "DONE" button
    Then I press the "DONE" button
    Then I wait

  @test2 @reset
  Scenario: Verify home screen
    Given I am on home screen
    Then I should see "Delhi"
    Then I touch "Delhi"
    Then I wait
    Then I should see a "DONE" button
    Then I press the "DONE" button
    Then I wait


  @test3
  Scenario: scroll down the home screen and check last element
    Given I am on home screen
    When I scroll till "Paris" from home screen
    Then I wait
    Then I should see "Paris"
    Then I touch "Paris"
    Then I should see a "DONE" button
    Then I press the "DONE" button
    Then I wait


  @test4
  Scenario: scroll down the home screen and check last element
    Given I am on home screen
    When I scroll till "Dublin" from home screen
    Then I wait
    Then I should see "Dublin"
    Then I touch "Dublin"
    Then I should see a "DONE" button
    Then I press the "DONE" button
    Then I wait