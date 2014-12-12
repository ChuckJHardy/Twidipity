Feature: Statement
  @omniauth_test
  Scenario: Follow
    Given I am a signed in user
    When I press "Follow" button
    Then I should see 'Unfollow' on the page
    And I should have a new Statement Record with a "active" status

  @omniauth_test
  Scenario: Unfollow
    Given I am a signed in user
    When I press "Follow" button
    And I click on 'Unfollow'
    Then I should see 'Follow' button on the page
    And I should have a new Statement Record with a "inactive" status

  @omniauth_test
  Scenario: Share Twidipity
    Given I am a signed in user
    Then I should see a Twitter "Share Twidipity" link

  @omniauth_test
  Scenario: Feedback
    Given I am a signed in user
    Then I should see a Feedback link
