Feature: User
  @omniauth_test
  Scenario: Signin
    Given I go to the homepage
    When I click on 'Join'
    Then I should be on the statement page

  @omniauth_test
  Scenario: Signout
    Given I am a signed in user
    When I click on 'Signout'
    Then I should be on the landing page
