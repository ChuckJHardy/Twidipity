Feature: Statement
  @omniauth_test
  Scenario: Share Twidipity
    Given I am a signed in user
    Then I should see a Twitter "Share Twidipity" link

  @omniauth_test
  Scenario: Feedback
    Given I am a signed in user
    Then I should see a Feedback link

  @omniauth_test
  Scenario: Feature Requests
    Given I am a signed in user
    Then I should see a Feature Requests link
