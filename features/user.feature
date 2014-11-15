Feature: User
  @omniauth_test
  Scenario: Signin
    Given I go to the new invite page
    When I click on "Signin" and callback
    Then I should be on the statement page

  @omniauth_test
  Scenario: Signout
    Given I am a signed in user
    When I click on "Signout"
    Then I should be on the invite page
