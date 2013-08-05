Feature: User views profile

  Scenario: View profile
    Given I am signed in
    When I follow "View Profile"
    Then I am on the view profile page
    And I see my profile
