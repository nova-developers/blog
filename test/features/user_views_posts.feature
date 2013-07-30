Feature: User views posts

  Scenario: User visits home page
    Given there are posts
    When I am on the home page
    Then I should see those posts
