Feature: User creates posts

  Scenario: Create post
    Given I am signed in
    When I follow "New Post"
    And I submit the post details
    Then I see the post details

  Scenario: Invalid post
    Given I am signed in
    When I follow "New Post"
    And I submit invalid post details
    Then I see a post error
