Feature: User signs in

  Scenario: Existing User signs in
    Given there is a user "johnny@example.com"
    When I am on the home page
    And I follow "Sign In"
    And I submit valid credentials
    Then I should be on that user profile page
