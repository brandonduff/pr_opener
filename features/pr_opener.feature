Feature: Opening a PR

  @opening_cassette
  Scenario: Opening a PR
    Given I have configured a valid API token
    And The remote branch "test" exists
    When I run `pr_opener open test`
    Then Github should respond with success
