Feature: Opening a PR

  Scenario: Opening a PR
    Given I have configured a valid API token
    And The remote branch "test_branch" exists
    When I run `pr_opener open test_branch`
    Then Github should respond with success
