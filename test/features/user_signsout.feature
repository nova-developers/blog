Feature: User signs out

  Scenario: sign out
    Given I am signed in
    When I follow "Sign Out"
    Then I am on the home page
    And I should see "Sign In"
