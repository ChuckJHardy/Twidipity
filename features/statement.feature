Feature: Statement
  @omniauth_test
  Scenario: Start
    Given I am a signed in user
    When I press "Start" button
    Then I should see 'Stop' on the page
    And I should have a new Statement Record with a "active" status

  @omniauth_test
  Scenario: Stop
    Given I am a signed in user
    When I press "Start" button
    And I click on 'Stop'
    Then I should see 'Start' button on the page
    And I should have a new Statement Record with a "inactive" status
