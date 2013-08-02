Feature: User edits profile

  Scenario: Edit Profile
    Given I am signed in
    When I follow "Edit Profile"
    And I update the user profile information
    Then I am on the view profile page
    And I see the updated profile
